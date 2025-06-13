//
//  ActivityView.swift
//  AlarmComDupe
//
//  Created by Marcus Shaffer on 6/8/25.
//

import SwiftUI

struct ActivityView: View {
    @State private var activityItem: [ActivityItem]?
    private let dataService: ActivityViewDataService = .init()
    private let formatter: DateFormatter = .init()

    var body: some View {
        ZStack(alignment: .bottom) {
            Color(.lightGray).opacity(0.25)
            HeaderView {
                HStack {
                    ActivityButtons()
                }.padding(.horizontal)
            }.zIndex(2)
            VStack {
                ActivityScrollView(activityItem: activityItem, formatter: formatter)
            }.task {
                formatter.timeStyle = .short
                formatter.dateStyle = .none

                do {
                    let data = try await dataService.getActivityData()
                    activityItem = data
                } catch ActivityViewItemError.invalidURL {
                    print("Invalid URL")
                } catch ActivityViewItemError.invalidData {
                    print("Invalid Data")
                } catch ActivityViewItemError.invalidResponse {
                    print("Invalid Response")
                } catch {
                    print("Unexpected Error: \(error)")
                }
            }
            BottomNavigationView()
                .zIndex(1)
                .shadow(radius: 5)
                .navigationBarBackButtonHidden(true)
        }
    }
}

struct ActivityButtons: View {
    var body: some View {
        Spacer()
        Text("Title")
            .font(.system(size: 24))
            .foregroundColor(.white)
            .font(.headline)

        Spacer()
        Button(action: {}) {
            Image(systemName: "checkmark.square.fill").foregroundColor(.white)
                .frame(width: 12, height: 12)
        }
    }
}

struct ActivityScrollView: View {
    let activityItem: [ActivityItem]?
    let formatter: DateFormatter

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                HStack {
                    Text("Today")
                    Spacer()
                    Button {} label: {
                        Text("Expand All")
                    }.foregroundColor(.black).background(.gray.opacity(0.2)).cornerRadius(5)
                }
                if let activities = activityItem {
                    ForEach(activities) { activity in
                        CardView {
                            VStack(alignment: .center, spacing: 8) {
                                HStack {
                                    Image(systemName: activity.type.iconName)
                                        .foregroundColor(activity.type.iconName == "lightbulb.fill" ? .yellow : .black)
                                    VStack(alignment: .leading) {
                                        Text(activity.location).font(.headline)
                                        Text(activity.desc).font(.subheadline).foregroundColor(.gray)
                                    }
                                    Spacer()
                                    Text(formatter.string(from: activity.timestamp))
                                }

                                if activity.screenshot != nil {
                                    Image(activity.screenshot!)
                                        .resizable()
                                        .scaledToFit()
                                        .cornerRadius(8)
                                }
                            }
                        }
                    }
                } else {
                    ProgressView("Loading Activity...")
                }
            }.padding()
                .safeAreaInset(edge: .top) {
                    Color.clear.frame(height: 30)
                }
        }
    }
}

#Preview {
    ActivityView()
}
