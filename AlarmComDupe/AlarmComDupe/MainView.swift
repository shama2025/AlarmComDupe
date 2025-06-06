//
//  MainView.swift
//  AlarmComDupe
//
//  Created by Marcus Shaffer on 6/6/25.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        ZStack {
            Color(.lightGray)
                .ignoresSafeArea(edges: .all)

            VStack {
                HeaderView(headerText: "Alarm.Com")
                /** Add Card Elements
                         Security
                         Locks
                         Lights
                 */
                ScenesCardView()
                NavigationView()
            }
        }
    }
}

#Preview {
    MainView()
}
