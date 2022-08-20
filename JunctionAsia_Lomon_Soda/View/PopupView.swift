//
//  PopupView.swift
//  JunctionAsia_Lomon_Soda
//
//  Created by 지준용 on 2022/08/20.
//

import SwiftUI

struct PopupView: View {
    @Binding var isShowingFavorite: Bool
    
    @FetchRequest(entity: Liked.entity(), sortDescriptors: [])
    var liked: FetchedResults<Liked>
    
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
                
//                ForEach(0..<coreDataManager.likeds.imageURL.count) { num in
//                    AsyncImage(url: URL(string: liked.nftImage)){ image in
//                        image
//                            .resizable()
//                            .frame(width: 160, height: 160, alignment: .trailing)
//                            .aspectRatio(contentMode: .fit)
//                            .border(Color.black, width: 8)
//                    } placeholder: {
//                        ProgressView()
//                            .progressViewStyle(.circular)
//                    }
//                }
                
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(0..<3) {_ in
                            VStack {
                                ForEach(0..<2) {_ in
                                    VStack{
                                        Image("testImage")
                                            .resizable()
                                            .frame(width: 100, height: 100)
                                            .aspectRatio(contentMode: .fit)
                                            .border(.black, width: 10)
                                        Text("작품 이름 / 설명")
                                            .font(.system(size: 14, weight: .regular))
                                            .padding(5)
                                            .background(Rectangle().fill(Color.white))
                                    }
                                    .padding(.trailing, 80)
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
