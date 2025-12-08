//
//  ContactSupporttable.swift
//
//
//  Created by Maziar Saadatfar on 10/11/23.
//

import Foundation
import ControlKitBase

public protocol ContactSupportable: AnyObject {
    var contactSupportService: GenericServiceProtocol { get set }
    func sendContactSupport(viewRequest: ContactSupportViewRequest) async throws -> Result<ContactSupportResponse>?
}

extension ContactSupportable where Self: ContactSupportViewModel {
    public func sendContactSupport(viewRequest: ContactSupportViewRequest) async throws -> Result<ContactSupportResponse>? {
        let request = ContactSupportRequest(
            appId: serviceConfig.appId,
            viewReq: viewRequest
        )
        return try await contactSupportService.execute(request: request)
    }
}
