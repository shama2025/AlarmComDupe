//
//  SecuritySystemCardView.swift
//  AlarmComDupe
//
//  Created by Marcus Shaffer on 6/6/25.
//

import SwiftUI

struct SecuritySystemCardView: View {
    @State var isArmed = true

    var body: some View {
        CardView {
            VStack {
                HStack {
                    Text("Security System").font(.headline).foregroundColor(Color.gray)
                    Spacer()
                    Image(systemName: "arrow.right")
                }
                Spacer()
                HStack {
                    VStack {
                        Image(systemName: "shield")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(isArmed ? .green : .red)
                            .frame(maxWidth: 200, maxHeight: 200)
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
