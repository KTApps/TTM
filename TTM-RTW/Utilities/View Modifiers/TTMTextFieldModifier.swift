//
//  TTMTextFieldModifier.swift
//  TTM-RTW
//
//  Created by Tanaka Bere on 27/02/2024.
//

import SwiftUI

struct TTMTextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal, 24)
    }
}
