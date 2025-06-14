//
//  LocksCardBottomSheet.swift
//  AlarmComDupe
//
//  Created by Marcus Shaffer on 6/14/25.
//

import SwiftUI

struct LocksCardBottomSheet: View {
    @State var isLocked: Bool

    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack {
            VStack {
                Image(systemName: isLocked ? "lock.fill" : "lock.open.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(isLocked ? .green : .red)
                    .frame(maxWidth: 200, maxHeight: 200)
            }
            VStack {
                Text("Front Door").font(.title2)
                Text(isLocked ? "Locked" : "Unlocked").foregroundColor(isLocked ? .green : .red).bold()
            }

            VStack {
                Button(action: {
                    isLocked.toggle()
                }) {
                    Text(isLocked ? "Unlock" : "Lock")
                        .frame(maxWidth: .infinity)
                        .frame(height: 75)
                        .foregroundColor(.white)
                        .background(isLocked ? Color.red : Color.green)
                }.padding(.top).padding(.horizontal)
                Button {
                    dismiss()
                } label: {
                    Text("Done")
                        .frame(maxWidth: .infinity)
                        .frame(height: 75)
                        .foregroundColor(.white)
                        .background(Color.gray)
                }.padding(.horizontal)
            }
        }
    }
}

#Preview {
    LocksCardBottomSheet(isLocked: true)
}
