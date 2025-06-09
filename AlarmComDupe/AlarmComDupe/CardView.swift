//
//  CardView.swift
//  AlarmComDupe
//
//  Created by Marcus Shaffer on 6/6/25.
//

import SwiftUI

struct CardView<Content: View>: View {
    var content: () -> Content

    var body: some View {
        VStack {
            content()
        }
        .padding()
        .frame(width: 385)
        .background(Color.white)
        .cornerRadius(7)
        .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
    }
}

#Preview {
    CardView {
        Text("Hello From CardView")
    }
}
