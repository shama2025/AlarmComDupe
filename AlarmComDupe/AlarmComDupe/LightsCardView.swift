//
//  LightsCardView.swift
//  AlarmComDupe
//
//  Created by Marcus Shaffer on 6/6/25.
//

import SwiftUI

struct LightsCardView: View {
    // Update these when adding backend
    @State private var bedroomSpeed = 50.0
    @State private var patioSpeed = 50.0
    @State private var livingRoomSpeed = 50.0

    @State private var isEditingBedroom = false
    @State private var isEditingPatio = false
    @State private var isEditingLivingRoom = false

    @State private var isPatioLightOn = false
    @State private var isLivingRoomLightOn = false
    @State private var isBedroomLightOn = false

    var body: some View {
        CardView(height: 250) {
            VStack {
                HStack {
                    Text("Lights").font(.headline).foregroundColor(Color.gray)
                    Spacer()
                    Image(systemName: "arrow.right")
                }
                Spacer()
                VStack {
                    HStack {
                        Image(systemName: "lightbulb")
                        VStack {
                            Text("Bedroom")
                            Slider(
                                value: $bedroomSpeed,
                                in: 0 ... 100,
                                step: 1
                            ) {
                                Text("Speed")
                            } minimumValueLabel: {
                                Text("")
                            } maximumValueLabel: {
                                Text("%" + String(format: "%.0f", bedroomSpeed))
                            } onEditingChanged: { editing in
                                isEditingBedroom = editing
                            }.tint(.yellow)
                        }

                        Button {
                            print("Bedroom Lights Work!")
                            isBedroomLightOn = true
                        } label: {
                            Image(systemName: "lightbulb.fill").frame(width: 20, height: 20)

                        }.foregroundColor(isBedroomLightOn ? .yellow : .black)

                        Button {
                            print("Bedroom Lights Work!")
                            isBedroomLightOn = false
                        } label: {
                            Image(systemName: "lightbulb.fill").frame(width: 20, height: 20)
                        }.foregroundColor(!isBedroomLightOn ? .yellow : .black)
                    }
                    Divider()
                    Spacer()
                    HStack {
                        Image(systemName: "lightbulb")
                        VStack {
                            Text("Patio")
                            Slider(
                                value: $patioSpeed,
                                in: 0 ... 100,
                                step: 1
                            ) {
                                Text("Speed")
                            } minimumValueLabel: {
                                Text("")
                            } maximumValueLabel: {
                                Text("%" + String(format: "%.0f", patioSpeed))
                            } onEditingChanged: { editing in
                                isEditingPatio = editing
                            }.tint(.yellow)
                        }

                        Button {
                            print("Patio Lights Work!")
                            isPatioLightOn = true
                        } label: {
                            Image(systemName: "lightbulb.fill").frame(width: 20, height: 20)

                        }.foregroundColor(isPatioLightOn ? .yellow : .black)

                        Button {
                            print("Patio Lights Work!")
                            isPatioLightOn = false
                        } label: {
                            Image(systemName: "lightbulb.fill").frame(width: 20, height: 20)
                        }.foregroundColor(!isPatioLightOn ? .yellow : .black)
                    }
                    Spacer()
                    HStack {
                        Image(systemName: "lightbulb")
                        VStack {
                            Text("Living Room")
                            Slider(
                                value: $livingRoomSpeed,
                                in: 0 ... 100,
                                step: 1
                            ) {
                                Text("Speed")
                            } minimumValueLabel: {
                                Text("")
                            } maximumValueLabel: {
                                Text("%" + String(format: "%.0f", livingRoomSpeed))
                            } onEditingChanged: { editing in
                                isEditingLivingRoom = editing
                            }.tint(.yellow)
                        }

                        Button {
                            print("Living Room Lights Work!")
                            isLivingRoomLightOn = true
                        } label: {
                            Image(systemName: "lightbulb.fill").frame(width: 20, height: 20)
                        }.foregroundColor(isLivingRoomLightOn ? .yellow : .black)

                        Button {
                            print("Living Room Lights Work!")
                            isLivingRoomLightOn = false
                        } label: {
                            Image(systemName: "lightbulb.fill").frame(width: 20, height: 20)
                        }.foregroundColor(!isLivingRoomLightOn ? .yellow : .black)
                    }
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    LightsCardView()
}
