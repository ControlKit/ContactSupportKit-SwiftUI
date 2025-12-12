//
//  ContactSupportView+Style3.swift
//  ContactSupportKit
//
//  Created by Maziar Saadatfar on 9/4/25.
//
import Foundation
import SwiftUI
import ControlKitBase

public struct ContactSupportView_Style3: View, ContactSupportViewProtocol {
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
            
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    // Title
                    Text(config.titleText)
                        .font(config.titleFont)
                        .foregroundColor(config.titleColor)
                        .padding(.top, 55)
                        .padding(.horizontal, 24)
                    
                    // Subject Label
                    Text(config.subjectText)
                        .font(config.subjectLabelFont)
                        .foregroundColor(config.subjectTextColor)
                        .padding(.top, 46)
                        .padding(.horizontal, 24)
                    
                    // Subject TextField
                    
                    TextField(
                        "maziar",
                        text: $subjectText,
                        prompt: Text(config.subjectTextFieldPlaceHolder)
                            .foregroundColor(config.subjectTextFieldPlaceHolderColor)
                    ).font(config.subjectTextFieldFont)
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
                        .padding(.top, 33)
                        .padding(.horizontal, 24)
                    
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
                        .padding(.top, 33)
                        .padding(.horizontal, 24)
                    
                    // Message TextEditor
                    ZStack(alignment: .topLeading) {
                        TextEditor(text: $messageText)
                            .font(config.messageTextFiledFont)
                            .foregroundColor(config.messageTextFieldTextColor)
                            .frame(height: 200)
                            .overlay(
                                RoundedRectangle(cornerRadius: config.messageTextFieldRadius)
                                    .stroke(config.messageTextFieldBorderColor, lineWidth: config.messageTextFieldBorderWidth)
                            )
                            .cornerRadius(config.messageTextFieldRadius)
                            .padding(.top, 14)
                            .padding(.horizontal, 24)
                        if messageText.isEmpty {
                            Text(config.messagePlaceHolder)
                                .font(config.messagePlaceHolderFont)
                                .foregroundColor(config.messagePlaceHolderColor)
                                .padding(.top, 24)
                                .padding(.leading, 32)
                        }
                    }
                    .focused($focusedField, equals: .message)
                    HStack {
                        Spacer()
                        // Send Button
                        Button(action: {
                            sendRequest()
                        }) {
                            Text(config.sendButtonTitle)
                                .font(config.sendButtonFont)
                                .foregroundColor(config.sendButtonTitleColor)
                                .frame(width: 224, height: 52)
                                .background(config.sendButtonBackColor)
                                .overlay(
                                    RoundedRectangle(cornerRadius: config.sendButtonRadius)
                                        .stroke(config.sendButtonBorderColor, lineWidth: config.sendButtonBorderWidth)
                                )
                                .cornerRadius(config.sendButtonRadius)
                        }
                        .padding(.top, 50)
                        .padding(.horizontal, 24)
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        // Cancel Button
                        Button(action: {
                            environment.onCancel()
                        }) {
                            Text(config.cancelButtonTitle)
                                .font(config.cancelButtonFont)
                                .foregroundColor(config.cancelButtonTitleColor)
                                .frame(width: 224, height: 52)
                                .background(config.cancelButtonBackColor)
                                .overlay(
                                    RoundedRectangle(cornerRadius: config.cancelButtonRadius)
                                        .stroke(config.cancelButtonBorderColor, lineWidth: config.cancelButtonBorderWidth)
                                )
                                .cornerRadius(config.cancelButtonRadius)
                        }
                        .padding(.top, 14)
                        .padding(.horizontal, 24)
                        .padding(.bottom, 50)
                        Spacer()
                    }
                }
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

public class ContactSupportViewConfig_Style3: ContactSupportViewConfig {
    public override init() {
        super.init()
        style = .style3
        titleColor = Color(r: 30, g: 30, b: 30)
        
        subjectTextColor = Color(r: 84, g: 84, b: 84)
        emailTextColor = Color(r: 84, g: 84, b: 84)
        messageTextColor = Color(r: 84, g: 84, b: 84)
        
        subjectTextFieldBackColor = .clear
        emailTextFieldBackColor = .clear
        messageTextFieldBackColor = .clear
        
        subjectTextFieldBorderColor = Color(r: 198, g: 198, b: 198)
        emailTextFieldBorderColor = Color(r: 198, g: 198, b: 198)
        messageTextFieldBorderColor = Color(r: 198, g: 198, b: 198)
        
        subjectTextFieldPlaceHolderColor = Color(r: 167, g: 167, b: 167)
        emailTextFieldPlaceHolderColor = Color(r: 167, g: 167, b: 167)
        messagePlaceHolderColor = Color(r: 167, g: 167, b: 167)
        
        subjectTextFieldRadius = 20.0
        emailTextFieldRadius = 20.0
        messageTextFieldRadius = 20.0
        
        subjectTextFieldBorderWidth = 0.5
        emailTextFieldBorderWidth = 0.5
        messageTextFieldBorderWidth = 0.5
        
        sendButtonBackColor = Color(r: 163, g: 163, b: 163)
        cancelButtonBackColor = .clear
        cancelButtonTitleColor = Color(r: 163, g: 163, b: 163)
        cancelButtonBorderColor = Color(r: 163, g: 163, b: 163)
        sendButtonBorderColor = .clear
        sendButtonTitleColor = .black
        sendButtonRadius = 20.0
        cancelButtonRadius = 20.0
        containerViewBackColor = .white
        contentViewBackColor = .white
        
        alertSuccessIconColor = Color(r: 163, g: 163, b: 163)
        alertErrorIconColor = .red
        alertSuccessButtonBackgroundColor = Color(r: 163, g: 163, b: 163)
        alertSuccessTitleColor = Color(r: 163, g: 163, b: 163)
    }
}

