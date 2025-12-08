//
//  ContactSupportView.swift
//
//
//  Created by Maziar Saadatfar on 10/21/23.
//

import SwiftUI

public struct ContactSupportView: View {
    @ObservedObject var viewModel: ContactSupportViewModelWrapper
    let config: ContactSupportServiceConfig
    var onSuccess: (() -> Void)?
    var onCancel: (() -> Void)?
    
    @StateObject private var environment: ContactSupportViewEnvironment
    @State private var showSuccessAlert = false
    @State private var showErrorAlert = false
    @State private var errorMessage = ""
    @Environment(\.dismiss) private var dismiss
    
    public init(
        viewModel: ContactSupportViewModel,
        config: ContactSupportServiceConfig,
        onSuccess: (() -> Void)? = nil,
        onCancel: (() -> Void)? = nil
    ) {
        self.viewModel = ContactSupportViewModelWrapper(viewModel: viewModel)
        self.config = config
        self.onSuccess = onSuccess
        self.onCancel = onCancel
        
        // Create environment with closures that will be set up in onAppear
        let env = ContactSupportViewEnvironment(
            onSend: { _ in },
            onCancel: {}
        )
        self._environment = StateObject(wrappedValue: env)
    }
    
    public var body: some View {
        ZStack {
            ContactSupportViewStyle.make(
                viewModel: viewModel.viewModel,
                config: config.viewConfig,
                environment: environment
            )
            
            if showSuccessAlert {
                AlertView(
                    config: config.viewConfig,
                    type: .success,
                    title: config.viewConfig.successTitle,
                    message: config.viewConfig.successMessage,
                    onDismiss: {
                        showSuccessAlert = false
                        onSuccess?()
                        dismiss()
                    }
                )
            }
            
            if showErrorAlert {
                AlertView(
                    config: config.viewConfig,
                    type: .error,
                    title: config.viewConfig.errorTitle,
                    message: config.viewConfig.errorMessage + errorMessage,
                    onDismiss: {
                        showErrorAlert = false
                    }
                )
            }
        }
        .onAppear {
            viewModel.viewModel.setAction(.view)
            // Setup environment callbacks
            environment.onSend = { request in
                sendRequest(request: request)
            }
            environment.onCancel = {
                onCancel?()
                dismiss()
            }
        }
    }
    
    private func sendRequest(request: ContactSupportViewRequest) {
        Task {
            do {
                let _ = try await viewModel.viewModel.sendContactSupport(viewRequest: request)
                await MainActor.run {
                    showSuccessAlert = true
                }
            } catch {
                await MainActor.run {
                    errorMessage = error.localizedDescription
                    showErrorAlert = true
                }
            }
        }
    }
}

// Environment object to pass callbacks to child views
class ContactSupportViewEnvironment: ObservableObject {
    var onSend: (ContactSupportViewRequest) -> Void
    var onCancel: () -> Void
    
    init(onSend: @escaping (ContactSupportViewRequest) -> Void, onCancel: @escaping () -> Void) {
        self.onSend = onSend
        self.onCancel = onCancel
    }
}

