//
//  SecuritySystemCardBottomSheet.swift
//  AlarmComDupe
//
//  Created by Marcus Shaffer on 6/14/25.
//

import SwiftUI

struct SecuritySystemCardBottomSheet: View {
    @State var isArmed: Bool
    @State var isSilentAlarming = false
    @State var isNoEntryDelay = false

    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack {
            VStack {
                VStack {
                    Image(systemName: "shield")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(isArmed ? .green : .red)
                        .frame(maxWidth: 200, maxHeight: 200)
                }
                VStack {
                    Text("System").font(.title2)
                    Text("Disarmed").foregroundColor(.green).bold()
                }
            }

            VStack {
                HStack {
                    Button {
                        isSilentAlarming.toggle()
                    } label: {
                        Image(systemName: isSilentAlarming ? "checkmark.square" : "square")
                    }
                    Text("Silent Alarming")
                    Spacer()
                }
                Divider()
                HStack {
                    Button {
                        isNoEntryDelay.toggle()
                    } label: {
                        Image(systemName: isNoEntryDelay ? "checkmark.square" : "square")
                    }
                    Text("No Entry Delay")
                    Spacer()
                }
            }
            .buttonStyle(.plain)
        }
        VStack {
            Button(action: {
                // Would be some api update
            }) {
                Text("Arm (Stay)")
                    .frame(maxWidth: .infinity)
                    .frame(height: 75)
                    .foregroundColor(.white)
                    .background(Color.orange)
            }.padding(.horizontal)

            Button(action: {
                // Would be some api update
            }) {
                Text("Arm (Away)")
                    .frame(maxWidth: .infinity)
                    .frame(height: 75)
                    .foregroundColor(.white)
                    .background(Color.red)
            }.padding(.horizontal)
            Button(action: {
                dismiss()
            }) {
                Text("Done")
                    .frame(maxWidth: .infinity)
                    .frame(height: 75)
                    .foregroundColor(.white)
                    .background(Color.gray)
            }.padding(.horizontal)
        }
    }
}

#Preview {
    SecuritySystemCardBottomSheet(isArmed: true)
}
