//
//  ActivityView.swift
//  AlarmComDupe
//
//  Created by Marcus Shaffer on 6/8/25.
//

import SwiftUI

struct ActivityView: View {
    var activityArray: [String] = ["Activity 1", "Activity 2", "Activity 3", "Activity 4", "Activity 5"]

    var body: some View {
        ZStack(alignment: .bottom) {
            Color(.lightGray).opacity(0.25)
            HeaderView {
                HStack {
                    Spacer()
                    Text("Title")
                        .font(.system(size: 24))
                        .foregroundColor(.white)
                        .font(.headline)

                    Spacer()
                    Button(action: {}) {
                        Image(systemName: "checkmark.square.fill").foregroundColor(.white)
                            .frame(width: 12, height: 12)
                    }
                }.padding(.horizontal)
            }.zIndex(2)

            VStack {
                ScrollView {
                    VStack(spacing: 16) {
                        ForEach(activityArray, id: \.self) { activity in
                            CardView {
                                Text(activity)
                            }
                        }
                    }.padding()
                        .safeAreaInset(edge: .top) {
                            Color.clear.frame(height: 30)
                        }
                }
            }
            BottomNavigationView()
                .zIndex(1)
                .shadow(radius: 5)
                .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    ActivityView()
}
