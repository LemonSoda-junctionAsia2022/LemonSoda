//
//  MainView.swift
//  JunctionAsia_Lomon_Soda
//
//  Created by 지준용 on 2022/08/20.
//

import SwiftUI

struct MainView: View {
    var height: CGFloat = 2
    var body: some View {
        ZStack {
            Color.mainColor
                .ignoresSafeArea()
                HStack(spacing: 80) {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(1..<10) {_ in
                                VStack(spacing: 20) {
                                    Image("testImage")
                                        .resizable()
                                        .frame(width: 160, height: 160)
                                    Text("작품 이름 / 설명")
                                        .background(Rectangle().fill(Color.clear)
                                            .border(Color.gray)
                                            .padding(-5))
                                }
                                .padding(.leading, 100)
                            }
                        }
                        Rectangle()
                            .foregroundColor(.yellow)
                            .frame(height: height)
                    }
                }
                .edgesIgnoringSafeArea(.horizontal)
            VStack {
                Spacer()
                HStack {
                    Image(systemName: "person")
                        .resizable()
                        .frame(width: 60, height: 90)
                    Spacer()
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
