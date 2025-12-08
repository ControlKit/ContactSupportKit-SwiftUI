//
//  ColorExtension.swift
//  ContactSupportKit
//
//  Created by Maziar Saadatfar
//

import SwiftUI

extension Color {
    public init(r: Int, g: Int, b: Int, a: Double = 1.0) {
        self.init(
            red: Double(r) / 255.0,
            green: Double(g) / 255.0,
            blue: Double(b) / 255.0,
            opacity: a
        )
    }
}

