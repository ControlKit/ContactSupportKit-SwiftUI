//
//  ContactSupportServiceConfig.swift
//
//
//  Created by Maziar Saadatfar on 10/12/23.
//

import Foundation
public struct ContactSupportServiceConfig {
    public init(style: ContactSupportViewStyle = .style1,
                appId: String) {
        self.viewConfig = ContactSupportViewStyle.getViewConfigWithStyle(style: style)
        self.appId = appId
    }
    public var appId: String
    public var sdkVersion: String = contactSupportKit_Version
    public var viewConfig: ContactSupportViewConfig
}
