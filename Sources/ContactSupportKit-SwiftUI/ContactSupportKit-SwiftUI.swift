// The Swift Programming Language
// https://docs.swift.org/swift-book
import Foundation
import SwiftUI
import Combine

public let contactSupportKit_Version: String = "1.0.0"
public class ContactSupportKit {
    public init() {
    }
    
    @MainActor
    public func configure(config: ContactSupportServiceConfig) -> some View {
        let viewModel = DefaultContactSupportViewModel(serviceConfig: config)
        return ContactSupportView(
            viewModel: viewModel,
            config: config
        )
    }
    
    @MainActor
    public func configureSheet(config: ContactSupportServiceConfig) -> some View {
        if #available(iOS 16.0, *) {
            let viewModel = DefaultContactSupportViewModel(serviceConfig: config)
            return ContactSupportView(
                viewModel: viewModel,
                config: config
            )
            .presentationDetents([.large])
            .presentationDragIndicator(.visible)
        } else {
            let viewModel = DefaultContactSupportViewModel(serviceConfig: config)
            return ContactSupportView(
                viewModel: viewModel,
                config: config
            )
        }
    }
}

