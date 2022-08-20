//
//  MainView.swift
//  JunctionAsia_Lomon_Soda
//
//  Created by 지준용 on 2022/08/20.
//

import SwiftUI

struct MainView: View {
    @State private var isShowing = false
    var height: CGFloat = 2
    
    var body: some View {
        ZStack {
            Color.mainColor
                .ignoresSafeArea()
            VStack {
                HStack{
                    Button(action: {
                        isShowing = true
                    }, label: {
                        Text("버튼")
                    })
                }
                .fullScreenCover(isPresented: $isShowing) {
                    popupView()
                }
                
                HStack(spacing: 80) {
                    ForEach(1..<10) {_ in
                        VStack(spacing: 20) {
                            Image("testImage")
                                .resizable()
                                .frame(width: 160, height: 160)
                                .aspectRatio(contentMode: .fit)
                            Text("작품 이름 / 설명")
                                .padding(5)
                                .font(.system(size: 16, weight: .bold))
                                .background(Rectangle().fill(Color.clear)
                                    .border(Color.gray)
                                )
                        }
                        .padding(.leading, 100)
                    }
                }
                Rectangle()
                    .foregroundColor(.yellow)
                    .frame(height: height)
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
