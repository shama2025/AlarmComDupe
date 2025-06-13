//
//  VideoView.swift
//  AlarmComDupe
//
//  Created by Marcus Shaffer on 6/7/25.
//

import AVKit
import SwiftUI

struct VideoView: View {
    @State private var player = AVPlayer()
    @State private var videoUrls: [VideoUrls]?

    private let dataService: VideoViewDataService = .init()

    var body: some View {
        ZStack(alignment: .bottom) {
            Color(.lightGray).opacity(0.25)
            HeaderView {
                HStack(spacing: 0) {
                    ToggleButtonView()
                }.padding()
                    .frame(width: 210, height: 33)
                    .background(.gray)
                    .cornerRadius(7)
                    .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
            }.zIndex(2)
            VStack {
                VideoScrollView(urls: videoUrls)
            }

            BottomNavigationView()
                .zIndex(1)
                .shadow(radius: 5)
                .navigationBarBackButtonHidden(true)
        }.task {
            do {
                let data = try await dataService.getVideoUrls()
                videoUrls = data
            } catch VideoViewItemError.invalidURL {
                print("Invalid URL")
            } catch VideoViewItemError.invalidData {
                print("Invalid Data")
            } catch VideoViewItemError.invalidResponse {
                print("Invalid response")
            } catch {
                print(error)
            }
        }
    }
}

struct VideoPlayerView: View {
    @State var player = AVPlayer()
    @State var url: URL

    var body: some View {
        VideoPlayer(player: player).onAppear {
            player = AVPlayer(url: url)
            player.play()
        }.frame(height: 300)
    }
}

struct ToggleButtonView: View {
    @State var isLiveScreen: Bool = true
    var body: some View {
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
    }
}

struct VideoScrollView: View {
    let urls: [VideoUrls]?

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                if let videos = urls {
                    ForEach(videos) { url in
                        CardView {
                            VideoPlayerView(url: URL(string: url.https_url)!)
                        }
                    }
                } else {
                    ProgressView("Loading Video...")
                }
            }
            .padding()
            .safeAreaInset(edge: .top) {
                Color.clear.frame(height: 30)
            }
        }
    }
}

#Preview {
    VideoView()
}
