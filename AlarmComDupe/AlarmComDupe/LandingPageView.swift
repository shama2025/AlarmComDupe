//
//  MainView.swift
//  AlarmComDupe
//
//  Created by Marcus Shaffer on 6/7/25.
//

import SwiftUI

struct LandingPageView: View {
    @State private var navigateToHome = false
        var body: some View {
                NavigationStack {
                    VStack {
                    }
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            navigateToHome = true
                        }
                    }
                    .navigationDestination(isPresented: $navigateToHome) {
                        HomeView()
                            .navigationBarBackButtonHidden(true)
                    }
            }
  
        }
}

#Preview {
    LandingPageView()
}
