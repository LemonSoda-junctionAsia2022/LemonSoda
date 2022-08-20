//
//  PictureInfoView.swift
//  JunctionAsia_Lomon_Soda
//
//  Created by 지준용 on 2022/08/20.
//

import SwiftUI

struct PictureInfoView: View {
    @Binding var isShowingInfo: Bool
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
                .opacity(0.2)
            ZStack {
                Color.white
                HStack(spacing: 20) {
                    Image("testImage")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .aspectRatio(contentMode: .fit)
                    
                    VStack(alignment: .leading ,spacing: 10) {
                        HStack {
                            Spacer()
                            Button(action: {
                                isShowingInfo = false
                            }, label: {
                                Image(systemName: "xmark")
                            })
                        }
                        Text("작품이름: 레몬소다")
                        Text("작가: 에디")
                        Text("제작일자: 오늘!")
                        Text("설명: 어쩌구 저쩌구")
                    }
                    
                }
                .padding(.horizontal, 16)
            }
            .frame(width: UIScreen.main.bounds.width * 3 / 4, height: UIScreen.main.bounds.height * 3 / 4, alignment: .center)
            .cornerRadius(15)
        }
    }
}

