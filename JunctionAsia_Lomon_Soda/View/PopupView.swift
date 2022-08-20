//
//  PopupView.swift
//  JunctionAsia_Lomon_Soda
//
//  Created by 지준용 on 2022/08/20.
//

import SwiftUI

struct PopupView: View {
    
    @Binding var isShowingFavorite: Bool
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
                .opacity(0.2)
            ZStack {
                Color.white
                VStack {
                    ScrollView(showsIndicators: false) {
                        HStack {
                            Text("좋아하는 작품 모음")
                                .font(.system(size: 22, weight: .bold))
                                .padding(.top, 10)
                            Spacer()
                            Button(action: {
                                isShowingFavorite = false
                            }, label: {
                                Image(systemName: "xmark")
                            })
                        }
                        
                        ForEach(0..<4) {_ in
                            HStack(spacing: 40) {
                                
                                ForEach(0..<3) {_ in
                                    VStack {
                                        Image("testImage")
                                            .resizable()
                                            .frame(width: 160, height: 160)
                                            .aspectRatio(contentMode: .fit)
                                        Text("작가 이름 / 작품이름")
                                            .font(.system(size: 16, weight: .bold))
                                    }
                                }
                            }
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 10)
                    .padding(.bottom, 10)
                }
            }
            .frame(width: UIScreen.main.bounds.width * 3 / 4, height: UIScreen.main.bounds.height * 3 / 4, alignment: .center)
            .cornerRadius(15)
        }
    }
}
