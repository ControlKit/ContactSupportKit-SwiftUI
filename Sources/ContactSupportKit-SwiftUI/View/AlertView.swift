//
//  AlertView.swift
//  ContactSupportKit
//
//  Created by Maziar Saadatfar on 10/13/25.
//

import SwiftUI

public enum AlertType {
    case success
    case error
}

public struct AlertView: View {
    let config: ContactSupportViewConfig
    let type: AlertType
    let title: String
    let message: String
    let onDismiss: (() -> Void)?
    
    @State private var isPresented: Bool = true
    @State private var scale: CGFloat = 0.8
    @State private var opacity: Double = 0
    
    public init(
        config: ContactSupportViewConfig,
        type: AlertType,
        title: String,
        message: String,
        onDismiss: (() -> Void)? = nil
    ) {
        self.config = config
        self.type = type
        self.title = title
        self.message = message
        self.onDismiss = onDismiss
    }
    
    public var body: some View {
        ZStack {
            // Overlay
            config.alertOverlayBackgroundColor
                .ignoresSafeArea()
                .opacity(opacity)
                .onTapGesture {
                    dismiss()
                }
            
            // Container
            VStack(spacing: 0) {
                // Icon
                Image(systemName: iconName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: config.alertIconSize, height: config.alertIconSize)
                    .foregroundColor(iconColor)
                    .padding(.top, config.alertIconTopMargin)
                
                // Title
                Text(title)
                    .font(config.alertTitleFont)
                    .foregroundColor(titleColor)
                    .multilineTextAlignment(.center)
                    .padding(.top, config.alertTitleTopMargin)
                    .padding(.horizontal, config.alertHorizontalPadding)
                
                // Message
                Text(message)
                    .font(config.alertMessageFont)
                    .foregroundColor(config.alertMessageColor)
                    .multilineTextAlignment(.center)
                    .padding(.top, config.alertMessageTopMargin)
                    .padding(.horizontal, config.alertHorizontalPadding)
                
                // Button
                Button(action: {
                    dismiss()
                }) {
                    Text(config.alertButtonTitle)
                        .font(config.alertButtonFont)
                        .foregroundColor(config.alertButtonTitleColor)
                        .frame(maxWidth: .infinity)
                        .frame(height: config.alertButtonHeight)
                        .background(buttonBackgroundColor)
                        .cornerRadius(config.alertButtonCornerRadius)
                }
                .padding(.top, config.alertButtonTopMargin)
                .padding(.bottom, config.alertButtonBottomMargin)
                .padding(.horizontal, config.alertHorizontalPadding)
            }
            .frame(width: config.alertContainerWidth)
            .background(config.alertContainerBackgroundColor)
            .cornerRadius(config.alertContainerCornerRadius)
            .shadow(
                color: config.alertContainerShadowColor.opacity(config.alertContainerShadowOpacity),
                radius: config.alertContainerShadowRadius,
                x: config.alertContainerShadowOffset.width,
                y: config.alertContainerShadowOffset.height
            )
            .scaleEffect(scale)
            .opacity(opacity)
        }
        .onAppear {
            withAnimation(.easeOut(duration: config.alertFadeAnimationDuration)) {
                opacity = 1
            }
            withAnimation(
                .spring(
                    response: config.alertScaleAnimationDuration,
                    dampingFraction: config.alertScaleAnimationDamping,
                    blendDuration: config.alertScaleAnimationVelocity
                )
            ) {
                scale = 1.0
            }
        }
    }
    
    private var iconName: String {
        switch type {
        case .success:
            return config.alertSuccessIconName
        case .error:
            return config.alertErrorIconName
        }
    }
    
    private var iconColor: Color {
        switch type {
        case .success:
            return config.alertSuccessIconColor
        case .error:
            return config.alertErrorIconColor
        }
    }
    
    private var titleColor: Color {
        switch type {
        case .success:
            return config.alertSuccessTitleColor
        case .error:
            return config.alertErrorTitleColor
        }
    }
    
    private var buttonBackgroundColor: Color {
        switch type {
        case .success:
            return config.alertSuccessButtonBackgroundColor
        case .error:
            return config.alertErrorButtonBackgroundColor
        }
    }
    
    private func dismiss() {
        withAnimation(.easeOut(duration: config.alertFadeAnimationDuration)) {
            opacity = 0
            scale = config.alertInitialScale
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + config.alertFadeAnimationDuration) {
            isPresented = false
            onDismiss?()
        }
    }
}

