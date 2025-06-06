//
//  NavigationView.swift
//  AlarmComDupe
//
//  Created by Marcus Shaffer on 6/6/25.
//

import SwiftUI

struct NavigationView: View {
    var body: some View {
        Spacer()
        HStack {
            Spacer()
            VStack {
                Image(systemName: "house")
                Text("Home")
            }
            Spacer()
            VStack {
                Image(systemName: "video")
                Text("Video")
            }
            Spacer()
            VStack {
                Image(systemName: "waveform.path.ecg")
                Text("Activity")
            }
            Spacer()
            VStack {
                Image(systemName: "line.3.horizontal")
                Text("Menu")
            }
            Spacer()

        }.background(Color.white).padding(.top)
    }
}

#Preview {
    NavigationView()
}
