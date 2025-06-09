//
//  MoreView.swift
//  AlarmComDupe
//
//  Created by Marcus Shaffer on 6/8/25.
//

import SwiftUI

struct MoreView: View {
    @State var accountElements: [MoreViewListsElements] = .init()

    @State var settingElements: [MoreViewListsElements] = .init()

    @State var infoElements: [MoreViewListsElements] = .init()

    var body: some View {
        ZStack(alignment: .bottom) {
            Color(.lightGray).opacity(0.25)
            HeaderView {
                Text("Alarm.Com").foregroundColor(.white).font(.title)
            }.zIndex(2)

            VStack(alignment: .leading, spacing: 16) {
                ScrollView {
                    Text("Account")
                        .font(.headline)
                        .padding(.top, 16)

                    ForEach(accountElements) { element in
                        HStack {
                            Image(systemName: element.image)
                                .foregroundColor(.black)
                            Text(element.label)
                            Spacer()
                        }
                        .padding(.vertical, 8)
                        Divider()
                    }

                    Text("Settings")
                        .font(.headline)
                        .padding(.top, 16)

                    ForEach(settingElements) { element in
                        HStack {
                            Image(systemName: element.image)
                                .foregroundColor(.black)
                            Text(element.label)
                            Spacer()
                        }
                        .padding(.vertical, 8)
                        Divider()
                    }

                    Text("More Info")
                        .font(.headline)
                        .padding(.top, 16)
                    ForEach(infoElements) { element in
                        HStack {
                            Image(systemName: element.image)
                                .foregroundColor(.black)

                            Text(element.label)
                            Spacer()
                        }
                        .padding(.vertical, 8)
                        Divider()
                    }
                }
                .padding()
                .safeAreaInset(edge: .top) {
                    Color.clear.frame(height: 30)
                        .onAppear {
                            accountElements = getAccountsElements()
                            settingElements = getSettingsElements()
                            infoElements = getInfoElements()
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
    MoreView()
}
