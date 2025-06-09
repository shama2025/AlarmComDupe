//
//  BottomNavigationView.swift
//  AlarmComDupe
//
//  Created by Marcus Shaffer on 6/6/25.
//

import SwiftUI

struct BottomNavigationView: View {
    var body: some View {
        Spacer()
        HStack {
            Spacer()
            NavigationLink(destination: HomeView()) {
                VStack {
                    Image(systemName: "house")
                    Text("Home")
                }
            }.foregroundColor(.black)
            Spacer()
            NavigationLink(destination: VideoView()) {
                VStack {
                    Image(systemName: "video")
                    Text("Video")
                }
            }.foregroundColor(.black)
            Spacer()
            NavigationLink(destination: ActivityView()) {
                VStack {
                    Image(systemName: "waveform.path.ecg")
                    Text("Activity")
                }
            }.foregroundColor(.black)
            Spacer()
            NavigationLink(destination: MoreView()) {
                VStack {
                    Image(systemName: "line.3.horizontal")
                    Text("More")
                }
            }.foregroundColor(.black)
            Spacer()

        }.background(Color.white).padding(.top)
    }
}

#Preview {
    BottomNavigationView()
}
