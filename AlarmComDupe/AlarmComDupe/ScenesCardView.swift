//
//  ScenesCardView.swift
//  AlarmComDupe
//
//  Created by Marcus Shaffer on 6/6/25.
//

import SwiftUI

struct ScenesCardView: View {
    var body: some View {
        VStack(spacing: 20) {
            CardView(height: 150) {
                VStack {
                    HStack {
                        Text("Scenes")
                            .font(.headline).foregroundColor(Color.gray)
                        Spacer()
                        Image(systemName: "arrow.right")
                    }

                    Spacer()

                    VStack {
                        HStack {
                            VStack {
                                HStack(spacing: 8) {
                                    Image(systemName: "arrow.right")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 20, height: 20)
                                        .foregroundColor(.green)

                                    Image(systemName: "house.fill")
                                        .resizable()
                                        .foregroundColor(.gray)
                                        .scaledToFit()
                                        .frame(width: 24, height: 24)
                                }
                                .padding(8)
                                .background(Color.white)
                                .cornerRadius(10)
                                .shadow(radius: 2)

                                Text("Home")
                            }
                            Spacer()
                            VStack {
                                HStack {
                                    VStack {
                                        HStack(spacing: 8) {
                                            Image(systemName: "arrow.left")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 20, height: 20)
                                                .foregroundColor(.red)

                                            Image(systemName: "house.fill")
                                                .resizable()
                                                .foregroundColor(.gray)
                                                .scaledToFit()
                                                .frame(width: 24, height: 24)
                                        }
                                        .padding(8)
                                        .background(Color.white)
                                        .cornerRadius(10)
                                        .shadow(radius: 2)

                                        Text("Away")
                                    }
                                }
                            }

                            Spacer()

                            VStack {
                                Image(systemName: "moon")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 24, height: 24)
                                    .padding(8)
                                    .background(Color.white)
                                    .cornerRadius(10)
                                    .shadow(radius: 2)
                                    .foregroundColor(.blue)

                                Text("Sleep")
                            }

                            Spacer()

                            VStack {
                                Image(systemName: "alarm")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 24, height: 24)
                                    .padding(8)
                                    .background(Color.white)
                                    .cornerRadius(10)
                                    .shadow(radius: 2)
                                    .foregroundColor(.yellow)

                                Text("Wake Up")
                            }

                            Spacer()
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ScenesCardView()
}
