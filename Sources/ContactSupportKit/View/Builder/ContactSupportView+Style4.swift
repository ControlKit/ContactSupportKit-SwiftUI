//
//  ContactSupportView+Style4.swift
//  ContactSupportKit
//
//  Created by Maziar Saadatfar on 9/4/25.
//
import Foundation
import SwiftUI

public struct ContactSupportView_Style4: View, ContactSupportViewProtocol {
    @StateObject private var viewModel: ContactSupportViewModelWrapper
    let config: ContactSupportViewConfig
    @EnvironmentObject var environment: ContactSupportViewEnvironment
    
    @State private var subjectText: String = ""
    @State private var emailText: String = ""
    @State private var messageText: String = ""
    @FocusState private var focusedField: Field?
    
    enum Field {
        case subject, email, message
    }
    
    public init(viewModel: ContactSupportViewModel, config: ContactSupportViewConfig) {
        self._viewModel = StateObject(wrappedValue: ContactSupportViewModelWrapper(viewModel: viewModel))
        self.config = config
    }
    
    public var body: some View {
        ZStack {
            config.contentViewBackColor
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                Spacer()
                
                // Container View
                VStack(alignment: .leading, spacing: 0) {
                    // Title
                    Text(config.titleText)
                        .font(config.titleFont)
                        .foregroundColor(config.titleColor)
                        .padding(.top, 40)
                        .padding(.horizontal, 24)
                        .frame(height: 36)
                    
                    // Subject Label
                    Text(config.subjectText)
                        .font(config.subjectLabelFont)
                        .foregroundColor(config.subjectTextColor)
                        .padding(.top, 46)
                        .padding(.horizontal, 24)
                        .frame(height: 17)
                    
                    // Subject TextField
                    TextField(config.subjectTextFieldPlaceHolder, text: $subjectText)
                        .font(config.subjectTextFieldFont)
                        .foregroundColor(config.subjectTextFieldTextColor)
                        .padding(.horizontal, 16)
                        .frame(height: 42)
                        .background(config.subjectTextFieldBackColor)
                        .overlay(
                            RoundedRectangle(cornerRadius: config.subjectTextFieldRadius)
                                .stroke(config.subjectTextFieldBorderColor, lineWidth: config.subjectTextFieldBorderWidth)
                        )
                        .cornerRadius(config.subjectTextFieldRadius)
                        .padding(.top, 14)
                        .padding(.horizontal, 24)
                        .focused($focusedField, equals: .subject)
                    
                    // Email Label
                    Text(config.emailText)
                        .font(config.emailLabelFont)
                        .foregroundColor(config.emailTextColor)
                        .padding(.top, 32)
                        .padding(.horizontal, 24)
                        .frame(height: 17)
                    
                    // Email TextField
                    TextField(config.emailTextFieldPlaceHolder, text: $emailText)
                        .font(config.emailTextFieldFont)
                        .foregroundColor(config.emailTextFieldTextColor)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .padding(.horizontal, 16)
                        .frame(height: 42)
                        .background(config.emailTextFieldBackColor)
                        .overlay(
                            RoundedRectangle(cornerRadius: config.emailTextFieldRadius)
                                .stroke(config.emailTextFieldBorderColor, lineWidth: config.emailTextFieldBorderWidth)
                        )
                        .cornerRadius(config.emailTextFieldRadius)
                        .padding(.top, 14)
                        .padding(.horizontal, 24)
                        .focused($focusedField, equals: .email)
                    
                    // Message Label
                    Text(config.messageText)
                        .font(config.messageLabelFont)
                        .foregroundColor(config.messageTextColor)
                        .padding(.top, 32)
                        .padding(.horizontal, 24)
                        .frame(height: 17)
                    
                    // Message TextEditor
                    ZStack(alignment: .topLeading) {
                        if messageText.isEmpty {
                            Text(config.messagePlaceHolder)
                                .font(config.messagePlaceHolderFont)
                                .foregroundColor(config.messagePlaceHolderColor)
                                .padding(.top, 16)
                                .padding(.leading, 16)
                        }
                        
                        TextEditor(text: $messageText)
                            .font(config.messageTextFiledFont)
                            .foregroundColor(config.messageTextFieldTextColor)
                            .frame(height: 160)
                            .overlay(
                                RoundedRectangle(cornerRadius: config.messageTextFieldRadius)
                                    .stroke(config.messageTextFieldBorderColor, lineWidth: config.messageTextFieldBorderWidth)
                            )
                            .cornerRadius(config.messageTextFieldRadius)
                            .padding(.top, 14)
                            .padding(.horizontal, 16)
                    }
                    .focused($focusedField, equals: .message)
                    
                    // Buttons View
                    HStack(spacing: 6) {
                        // Cancel Button
                        Button(action: {
                            environment.onCancel()
                        }) {
                            Text(config.cancelButtonTitle)
                                .font(config.cancelButtonFont)
                                .foregroundColor(config.cancelButtonTitleColor)
                                .frame(width: 188, height: 52)
                                .background(config.cancelButtonBackColor)
                                .overlay(
                                    RoundedRectangle(cornerRadius: config.cancelButtonRadius)
                                        .stroke(config.cancelButtonBorderColor, lineWidth: config.cancelButtonBorderWidth)
                                )
                                .cornerRadius(config.cancelButtonRadius)
                        }
                        
                        // Send Button
                        Button(action: {
                            sendRequest()
                        }) {
                            Text(config.sendButtonTitle)
                                .font(config.sendButtonFont)
                                .foregroundColor(config.sendButtonTitleColor)
                                .frame(width: 188, height: 52)
                                .background(config.sendButtonBackColor)
                                .overlay(
                                    RoundedRectangle(cornerRadius: config.sendButtonRadius)
                                        .stroke(config.sendButtonBorderColor, lineWidth: config.sendButtonBorderWidth)
                                )
                                .cornerRadius(config.sendButtonRadius)
                        }
                    }
                    .padding(.top, 32)
                    .padding(.horizontal, 24)
                    .padding(.bottom, 40)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 667)
                .background(config.containerViewBackColor)
                .cornerRadius(20)
            }
        }
    }
    
    private func sendRequest() {
        let request = ContactSupportViewRequest(
            email: emailText,
            subject: subjectText,
            message: messageText
        )
        environment.onSend(request)
    }
}

public class ContactSupportViewConfig_Style4: ContactSupportViewConfig {
    public override init() {
        super.init()
        style = .style4
        containerViewBackColor = .white
        contentViewBackColor = Color(r: 133, g: 176, b: 227)
        
        titleColor = Color(r: 83, g: 110, b: 141)
        titleFont = Font.system(size: 24, weight: .bold)
        
        subjectTextColor = Color(r: 83, g: 110, b: 141)
        emailTextColor = Color(r: 83, g: 110, b: 141)
        messageTextColor = Color(r: 83, g: 110, b: 141)
        
        subjectTextFieldBackColor = .clear
        emailTextFieldBackColor = .clear
        messageTextFieldBackColor = .clear
        
        subjectTextFieldBorderColor = Color(r: 197, g: 222, b: 252)
        emailTextFieldBorderColor = Color(r: 197, g: 222, b: 252)
        messageTextFieldBorderColor = Color(r: 197, g: 222, b: 252)
        
        subjectTextFieldPlaceHolderColor = Color(r: 120, g: 139, b: 168)
        emailTextFieldPlaceHolderColor = Color(r: 120, g: 139, b: 168)
        messagePlaceHolderColor = Color(r: 120, g: 139, b: 168)
        
        subjectTextFieldRadius = 20.0
        emailTextFieldRadius = 20.0
        messageTextFieldRadius = 20.0
        
        sendButtonBackColor = Color(r: 133, g: 176, b: 227)
        cancelButtonBackColor = .clear
        cancelButtonTitleColor = Color(r: 133, g: 176, b: 227)
        cancelButtonBorderColor = Color(r: 133, g: 176, b: 227)
        sendButtonBorderColor = .clear
        sendButtonTitleColor = .white
        sendButtonRadius = 20.0
        cancelButtonRadius = 20.0
        
        alertSuccessIconColor = Color(r: 133, g: 176, b: 227)
        alertErrorIconColor = .red
        alertSuccessButtonBackgroundColor = Color(r: 133, g: 176, b: 227)
        alertSuccessTitleColor = Color(r: 133, g: 176, b: 227)
    }
}

