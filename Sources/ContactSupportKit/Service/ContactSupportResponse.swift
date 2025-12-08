//
//  ContactSupportResponse.swift
//
//
//  Created by Maziar Saadatfar on 10/12/23.
//

import Foundation
public struct ContactSupportResponse: Codable {
    public var data: ContactSupportModel?
}
public struct ContactSupportModel: Codable {
    public let id: String
    public let email: String?
    public let subject: String?
    public let message: String?
    public let version: String?
    public let created_at: String?
}
