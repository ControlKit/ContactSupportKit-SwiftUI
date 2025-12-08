//
//  ContactSupportViewConfig.swift
//  
//
//  Created by Maziar Saadatfar on 10/18/23.
//

import Foundation
import SwiftUI
import ControlKitBase

public class ContactSupportViewConfig {
    public init() {}
    public var style: ContactSupportViewStyle = .style1
    public var contentViewBackColor: Color = Color(r: 25, g: 29, b: 32)
    public var containerViewBackColor: Color = Color(r: 25, g: 29, b: 32)
    
    public var titleFont = Font.system(size: 24, weight: .bold)
    public var titleText = "ContactSupport"
    public var titleColor: Color = Color(r: 30, g: 30, b: 30)
    
    public var subjectLabelFont = Font.system(size: 14, weight: .semibold)
    public var subjectText = "Subject"
    public var subjectTextColor: Color = Color(r: 84, g: 84, b: 84)
    
    public var emailLabelFont = Font.system(size: 14, weight: .semibold)
    public var emailText = "E-mail Address"
    public var emailTextColor: Color = Color(r: 84, g: 84, b: 84)
    
    public var messageLabelFont = Font.system(size: 14, weight: .semibold)
    public var messageText = "Message"
    public var messageTextColor: Color = Color(r: 84, g: 84, b: 84)
    
    public var subjectTextFieldFont = Font.system(size: 14, weight: .regular)
    public var subjectTextFieldPlaceHolderFont = Font.system(size: 10, weight: .regular)
    public var subjectTextFieldPlaceHolder = "Please insert the subject"
    public var subjectTextFieldPlaceHolderColor = Color(r: 198, g: 198, b: 198)
    
    public var subjectTextFieldBorderColor: Color = Color(r: 198, g: 198, b: 198)
    public var subjectTextFieldBorderWidth: CGFloat = 1.0
    public var subjectTextFieldRadius: CGFloat = 20.0
    public var subjectTextFieldTextColor: Color = .black
    public var subjectTextFieldBackColor: Color = .blue
    
    public var emailTextFieldPlaceHolderFont = Font.system(size: 10, weight: .regular)
    public var emailTextFieldFont = Font.system(size: 14, weight: .regular)
    public var emailTextFieldPlaceHolder = "Please insert the email"
    public var emailTextFieldPlaceHolderColor = Color(r: 198, g: 198, b: 198)
    public var emailTextFieldBorderColor: Color = Color(r: 198, g: 198, b: 198)
    public var emailTextFieldBorderWidth: CGFloat = 1.0
    public var emailTextFieldRadius: CGFloat = 20.0
    public var emailTextFieldTextColor: Color = .black
    public var emailTextFieldBackColor: Color = .blue
    
    
    public var messagePlaceHolder = "Please insert your message in less than 600 character"
    public var messagePlaceHolderColor = Color(r: 198, g: 198, b: 198)
    public var messagePlaceHolderFont = Font.system(size: 10, weight: .regular)
    
    public var messageTextFiledFont = Font.system(size: 14, weight: .regular)
    public var messageTextFieldBorderColor: Color = Color(r: 198, g: 198, b: 198)
    public var messageTextFieldBorderWidth: CGFloat = 1.0
    public var messageTextFieldRadius: CGFloat = 20.0
    public var messageTextFieldTextColor: Color = .black
    public var messageTextFieldBackColor: Color = .clear
    
    public var sendButtonFont = Font.system(size: 15, weight: .semibold)
    public var sendButtonTitle = "Send"
    public var sendButtonTitleColor: Color = .black
    public var sendButtonBackColor: Color = Color(r: 163, g: 163, b: 163)
    public var sendButtonRadius: CGFloat = 20.0
    public var sendButtonBorderWidth: CGFloat = 1
    public var sendButtonBorderColor: Color = .clear
    
    public var cancelButtonFont = Font.system(size: 15, weight: .semibold)
    public var cancelButtonTitle = "Cancel"
    public var cancelButtonTitleColor: Color = Color(r: 163, g: 163, b: 163)
    public var cancelButtonBorderColor: Color = Color(r: 163, g: 163, b: 163)
    public var cancelButtonBackColor: Color = .clear
    public var cancelButtonBorderWidth: CGFloat = 1.0
    public var cancelButtonRadius: CGFloat = 20.0
    
    
    public var successTitle: String = "Success!"
    public var successMessage: String = "Your message has been sent successfully. We'll get back to you soon."
    
    
    public var errorTitle: String = "Error"
    public var errorMessage: String = "Failed to send your message. Please try again later.\n"
    
    // MARK: - Alert View Configuration
    // Container
    public var alertContainerBackgroundColor: Color = .white
    public var alertContainerCornerRadius: CGFloat = 16
    public var alertContainerWidth: CGFloat = 300
    public var alertContainerShadowColor: Color = .black
    public var alertContainerShadowOpacity: Double = 0.2
    public var alertContainerShadowOffset: CGSize = CGSize(width: 0, height: 4)
    public var alertContainerShadowRadius: CGFloat = 12
    
    // Overlay
    public var alertOverlayBackgroundColor: Color = Color.black.opacity(0.5)
    
    // Icon
    public var alertIconSize: CGFloat = 60
    public var alertIconTopMargin: CGFloat = 32
    public var alertSuccessIconName: String = "checkmark-circle-fill"
    public var alertErrorIconName: String = "xmark-circle-fill"
    public var alertSuccessIconColor: Color = .green
    public var alertErrorIconColor: Color = .red
    
    // Title
    public var alertTitleFont: Font = Font.system(size: 20, weight: .bold)
    public var alertTitleTopMargin: CGFloat = 20
    public var alertSuccessTitleColor: Color = .green
    public var alertErrorTitleColor: Color = .red
    
    // Message
    public var alertMessageFont: Font = Font.system(size: 16, weight: .regular)
    public var alertMessageColor: Color = .gray
    public var alertMessageTopMargin: CGFloat = 12
    
    // Button
    public var alertButtonFont: Font = Font.system(size: 16, weight: .semibold)
    public var alertButtonTitle: String = "OK"
    public var alertButtonCornerRadius: CGFloat = 8
    public var alertButtonHeight: CGFloat = 48
    public var alertButtonTopMargin: CGFloat = 24
    public var alertButtonBottomMargin: CGFloat = 24
    public var alertSuccessButtonBackgroundColor: Color = .green
    public var alertErrorButtonBackgroundColor: Color = .red
    public var alertButtonTitleColor: Color = .white
    
    // Spacing
    public var alertHorizontalPadding: CGFloat = 24
    
    // Animation
    public var alertFadeAnimationDuration: TimeInterval = 0.3
    public var alertScaleAnimationDuration: TimeInterval = 0.5
    public var alertScaleAnimationDamping: CGFloat = 0.7
    public var alertScaleAnimationVelocity: CGFloat = 0.5
    public var alertInitialScale: CGFloat = 0.8
}

