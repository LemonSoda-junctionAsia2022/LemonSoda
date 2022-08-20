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
        
        ZStack{
            Color.white
            
            VStack {
                HStack {
                    Text("좋아하는 사진 모음")
                    Spacer()
                    Button(action: {
                        isShowingFavorite = false
                    }, label: {
                        Image(systemName: "xmark")
                            .resizable()
                            .frame(width: 20, height: 20, alignment: .trailing)
                    })
                    
                }
                .padding(.horizontal, 16)

                ScrollView(.horizontal) {
                    HStack {
                        ForEach(0..<4) {_ in
                            VStack {
                                ForEach(0..<2) {_ in
                                    VStack{
                                        Image("testImage")
                                            .resizable()
                                            .frame(width: 100, height: 100)
                                            .aspectRatio(contentMode: .fit)
                                        Text("작품 이름 / 설명")
                                    }
                                }
                            }
                        }
                    }
                    .padding(.leading, 60)
                }
            }
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .leading)
        }
    }
}
