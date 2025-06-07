//
//  LocksCardView.swift
//  AlarmComDupe
//
//  Created by Marcus Shaffer on 6/6/25.
//

import SwiftUI

struct LocksCardView: View {
    var body: some View {
        CardView(height: 150) {
            VStack {
                HStack {
                    Text("Locks").font(.headline).foregroundColor(Color.gray)
                    Spacer()
                    Image(systemName: "arrow.right")
                }
                Spacer()
                HStack {
                    VStack {
                        // Will need boolean value to change image/text color
                        // isLocked: True -> Red
                        // isLocked: False -> Green
                        Image(systemName: "lock.open.fill") // "lock.fill"
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.green)
                    }
                    VStack {
                        Text("Front Door").font(.title2)
                        Text("Unlocked").foregroundColor(.green).bold()
                    }
                }
                Spacer()
            }
            // Has the ability to swipe and update view
        }
    }
}

#Preview {
    LocksCardView()
}
