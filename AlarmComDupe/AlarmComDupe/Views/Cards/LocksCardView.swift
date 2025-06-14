//
//  LocksCardView.swift
//  AlarmComDupe
//
//  Created by Marcus Shaffer on 6/6/25.
//

import SwiftUI

struct LocksCardView: View {
    @State var isLocked: Bool = true
    @State private var isSheetPresented = false

    var body: some View {
        CardView {
            VStack {
                HStack {
                    Text("Locks").font(.headline).foregroundColor(Color.gray)
                    Spacer()
                    Button {
                        isSheetPresented.toggle()
                    } label: {
                        Image(systemName: "arrow.right")
                    }.sheet(isPresented: $isSheetPresented) {
                        LocksCardBottomSheet(isLocked: isLocked)
                    }.foregroundColor(.gray)
                }
                Spacer()
                HStack {
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
                }
                Spacer()
            }
            // Has the ability to swipe and update view
        }
    }
}

#Preview {
    LocksCardView()
}
