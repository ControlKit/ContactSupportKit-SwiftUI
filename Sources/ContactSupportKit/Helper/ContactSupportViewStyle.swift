//
//  ContactSupportViewStyle.swift
//
//
//  Created by Maziar Saadatfar on 10/12/23.
//

import Foundation
import SwiftUI

public enum ContactSupportViewStyle {
    case style1
    case style2
    case style3
    case style4
    
    public static func make(viewModel: ContactSupportViewModel,
                            config: ContactSupportViewConfig,
                            environment: ContactSupportViewEnvironment) -> AnyView {
        switch config.style {
        case .style1:
            return AnyView(ContactSupportView_Style1(viewModel: viewModel, config: config)
                .environmentObject(environment))
        case .style2:
            return AnyView(ContactSupportView_Style2(viewModel: viewModel, config: config)
                .environmentObject(environment))
        case .style3:
            return AnyView(ContactSupportView_Style3(viewModel: viewModel, config: config)
                .environmentObject(environment))
        case .style4:
            return AnyView(ContactSupportView_Style4(viewModel: viewModel, config: config)
                .environmentObject(environment))
        }
    }
    
    public static func getViewConfigWithStyle(style: ContactSupportViewStyle) -> ContactSupportViewConfig {
        switch style {
        case .style1:
            return ContactSupportViewConfig_Style1()
        case .style2:
            return ContactSupportViewConfig_Style2()
        case .style3:
            return ContactSupportViewConfig_Style3()
        case .style4:
            return ContactSupportViewConfig_Style4()
        }
    }
}

