//
//  VideoView.swift
//  AlarmComDupe
//
//  Created by Marcus Shaffer on 6/7/25.
//

import SwiftUI

struct VideoView: View {
    @State var isLiveScreen: Bool = true

    var videos: [String] = ["Video 1", "Video 2", "Video 3", "Video 4", "Video 5"]

    var body: some View {
        ZStack(alignment: .bottom) {
            Color(.lightGray).opacity(0.25)
            HeaderView {
                HStack(spacing: 0) {
                    Button {
                        isLiveScreen = true
                    } label: {
                        Text("Live").foregroundColor(isLiveScreen ? .black : .white)
                            .frame(width: 100, height: 30)
                            .background(isLiveScreen ? .white : .black)
                            .cornerRadius(7)
                            .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
                    }

                    Button {
                        isLiveScreen = false
                    } label: {
                        Text("Saved").foregroundColor(!isLiveScreen ? .black : .white)
                            .frame(width: 100, height: 30)
                            .background(!isLiveScreen ? .white : .black)
                            .cornerRadius(7)
                            .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
                    }
                }.padding()
                    .frame(width: 210, height: 33)
                    .background(.gray)
                    .cornerRadius(7)
                    .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
            }.zIndex(2)
            VStack {
                ScrollView {
                    ForEach(videos, id: \.self) { video in
                        CardView(height: 150) {
                            Text(video)
                        }
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
    VideoView()
}
