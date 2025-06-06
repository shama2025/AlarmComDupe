//
//  HeaderView.swift
//  AlarmComDupe
//
//  Created by Marcus Shaffer on 6/6/25.
//

import SwiftUI

struct HeaderView: View {
    var headerText: String

    var body: some View {
        ZStack(alignment: .top) {
            Color(red: 204 / 255, green: 85 / 255, blue: 0 / 255).ignoresSafeArea(.all).frame(height: 35)
            VStack {
                Text(headerText).foregroundColor(.white).font(.title)
                Spacer()
            }
        }
    }
}

#Preview {
    HeaderView(headerText: "Alarm.com")
}
