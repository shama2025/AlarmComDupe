//
//  SecuritySystemCardView.swift
//  AlarmComDupe
//
//  Created by Marcus Shaffer on 6/6/25.
//

import SwiftUI

struct SecuritySystemCardView: View {
    @State var isArmed = true
    @State private var isSheetPresented = false

    var body: some View {
        CardView {
            VStack {
                HStack {
                    Text("Security System").font(.headline).foregroundColor(Color.gray)
                    Spacer()
                    Button {
                        isSheetPresented.toggle()
                    } label: {
                        Image(systemName: "arrow.right")
                    }.sheet(isPresented: $isSheetPresented) {
                        SecuritySystemCardBottomSheet(isArmed: isArmed)
                    }.foregroundColor(.gray)
                }
                Spacer()
                HStack {
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
                Spacer()
            }
        }
    }
}

#Preview {
    SecuritySystemCardView()
}
