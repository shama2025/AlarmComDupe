//
//  MainView.swift
//  AlarmComDupe
//
//  Created by Marcus Shaffer on 6/6/25.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            HeaderView(headerText: "Alarm.Com").zIndex(2)
            VStack{
                ScrollView {
                    VStack(spacing: 20) {
                        
                        ScenesCardView()
                        SecuritySystemCardView()
                        LocksCardView()
                        LightsCardView()
                        
                        Spacer(minLength: 80)
                    }
                    .padding()
                }

            }
                    
                    NavigationView()
                        .zIndex(1)
                        .shadow(radius: 5)
                }
        
    }
}

#Preview {
    MainView()
}
