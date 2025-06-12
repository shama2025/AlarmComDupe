//
//  VideoView.swift
//  AlarmComDupe
//
//  Created by Marcus Shaffer on 6/7/25.
//

import AVKit
import SwiftUI

struct VideoView: View {
    @State private var isLiveScreen: Bool = true
//    @State private var players: [AVPlayer?] = []
//    @State private var videosUrl: [CamerasHttp] = []
//
//    private let dataService: VideoViewDataService = .init()

    var body: some View {
        ZStack(alignment: .bottom) {
            Color(.lightGray).opacity(0.25)

            // Header toggle
            HeaderView {
                HStack(spacing: 0) {
                    Button {
                        isLiveScreen = true
                    } label: {
                        Text("Live")
                            .foregroundColor(isLiveScreen ? .black : .white)
                            .frame(width: 100, height: 30)
                            .background(isLiveScreen ? .white : .black)
                            .cornerRadius(7)
                            .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
                    }

                    Button {
                        isLiveScreen = false
                    } label: {
                        Text("Saved")
                            .foregroundColor(!isLiveScreen ? .black : .white)
                            .frame(width: 100, height: 30)
                            .background(!isLiveScreen ? .white : .black)
                            .cornerRadius(7)
                            .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
                    }
                }
                .padding()
                .frame(width: 210, height: 33)
                .background(.gray)
                .cornerRadius(7)
                .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
            }
            .zIndex(2)

            // Scrollable video cards
            VStack {
                ScrollView {
                    VStack(spacing: 16) {
//                        ForEach(players.indices, id: \.self) { index in
//                            CardView {
//                                if let player = players[index] {
//                                    VStack(alignment: .leading) {
//                                        if index < videosUrl.count {
//                                            Text(videosUrl[index].camera_name)
//                                                .font(.headline)
//                                                .padding(.bottom, 5)
//                                        }
//
//                                        VideoPlayer(player: player)
//                                            .frame(height: 200)
//                                            .onAppear {
//                                                player.play()
//                                            }
//                                    }
//                                } else {
//                                    Text("Video failed to load")
//                                        .frame(height: 200)
//                                        .background(Color.gray.opacity(0.2))
//                                }
//                            }
//                        }
                    }
                    .padding()
                    .safeAreaInset(edge: .top) {
                        Color.clear.frame(height: 30)
                    }
                }
            }

            // Bottom navigation
            BottomNavigationView()
                .zIndex(1)
                .shadow(radius: 5)
                .navigationBarBackButtonHidden(true)
        }
        .task {
//            do {
//                // Fetch camera URLs
//                let urls = try await dataService.getVideoUrl()
//                self.videosUrl = urls
//
//                // Load AVPlayers from HTTP stream links
//                dataService.loadStreams(videos: urls) { loadedPlayers in
//                    DispatchQueue.main.async {
//                        self.players = loadedPlayers
//                    }
//                }
//
//            } catch VideoViewItemError.invalidURL {
//                print("Invalid URL")
//            } catch VideoViewItemError.invalidData {
//                print("Invalid Data")
//            } catch VideoViewItemError.invalidResponse {
//                print("Invalid Response")
//            } catch {
//                print("Unexpected Error: \(error)")
//            }
        }
    }
}

#Preview {
    VideoView()
}
