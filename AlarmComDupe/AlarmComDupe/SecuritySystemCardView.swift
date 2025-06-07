//
//  SecuritySystemCardView.swift
//  AlarmComDupe
//
//  Created by Marcus Shaffer on 6/6/25.
//

import SwiftUI

struct SecuritySystemCardView: View {
    var body: some View {
        CardView(height: 200) {
            VStack {
                HStack {
                    Text("Security System").font(.headline).foregroundColor(Color.gray)
                    Spacer()
                    Image(systemName: "arrow.right")
                }
                Spacer()
                HStack {
                    VStack {
                        // Will need boolean value to change image/text color
                        // isArmed: True -> Red
                        // isArmed: False -> Green
                        Image(systemName: "shield")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.green)
                    }
                    VStack {
                        Text("System").font(.title2)
                        Text("Disarmed").foregroundColor(.green).bold()
                    }
                }
                Spacer()
            }
            // Has the ability to swipe and update view
        }
    }
}

#Preview {
    SecuritySystemCardView()
}
