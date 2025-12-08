//
//  Actionable.swift
//  ContactSupportKit
//
//  Created by Maziar Saadatfar on 10/13/25.
//
import ControlKitBase
public protocol Actionable {
    func setAction(_ action: ControlKitAction)
}
public extension Actionable where Self: ContactSupportViewModel {
    func setAction(_ action: ControlKitAction) {
        Task {
            var request = ControlKitBase.ActionRequest(
                route: .contact_support,
                appId: serviceConfig.appId,
                sdkVersion: contactSupportKit_Version,
                action: action
            )
            request.extraParameter = "action"
            let _: Result<ActionResponse> = try await actionService.execute(request: request)
        }
    }
}
