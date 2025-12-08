//
//  ContactSupportRequest.swift
//
//
//  Created by Maziar Saadatfar on 10/12/23.
//

import Foundation
import ControlKitBase
public struct ContactSupportRequest: GenericRequest {
    public var itemId: String?
    public var extraParameter: String?
    public var appId: String
    public var httpMethod: HTTPMethod = .post
    public var route: ControlKitItem = .contact_support
    public var deviceUUID: String = CKDeviceUUID
    public var sdkVersion: String = contactSupportKit_Version
    public var applicationVersion: String = Bundle.main.releaseVersionNumber ?? String()
    
    public var email: String
    public var subject: String
    public var message: String
    
    init(
        appId: String,
        viewReq: ContactSupportViewRequest
    ) {
        self.appId = appId
        self.email = viewReq.email
        self.subject = viewReq.subject
        self.message = viewReq.message
    }
    
    public var body: [String: String] {
        return ["email": email,
                "subject": subject,
                "message": message]
    }
    
    public var headers: [String: String] {
        return ["x-app-id": appId,
                "x-sdk-version": sdkVersion,
                "x-version": applicationVersion,
                "x-device-uuid": deviceUUID]
    }
}

public struct ContactSupportViewRequest {
    public var email: String
    public var subject: String
    public var message: String
}
