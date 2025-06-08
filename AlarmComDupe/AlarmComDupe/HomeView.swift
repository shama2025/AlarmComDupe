//
//  MainView.swift
//  AlarmComDupe
//
//  Created by Marcus Shaffer on 6/6/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            Color(.lightGray).opacity(0.25)
            HeaderView{
                Text("Alarm.Com").foregroundColor(.white).font(.title)
            }.zIndex(2)
            VStack {
                ScrollView {
                    VStack(spacing: 20) {
                        Spacer()
                        ScenesCardView()
                        SecuritySystemCardView()
                        LocksCardView()
                        LightsCardView()

                        Spacer(minLength: 80)
                    }.padding()
                }
            }

            NavigationStack{
                BottomNavigationView()
                    .zIndex(1)
                    .shadow(radius: 5)
            }.navigationBarBackButtonHidden(true)
          
        }
    }
}

#Preview {
    HomeView()
}
