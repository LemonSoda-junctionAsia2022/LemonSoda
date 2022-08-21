//
//  PopupView.swift
//  JunctionAsia_Lomon_Soda
//
//  Created by 지준용 on 2022/08/20.
//

import SwiftUI

struct PopupView: View {
    @Binding var isShowingFavorite: Bool
//    @Binding var likeColor: Bool
    @Environment(\.managedObjectContext) private var viewContext

//    @FetchRequest(entity: Liked.entity(), sortDescriptors: [])
    var artWorkInformation: UnitDatum?

//    var liked: FetchedResults<Liked>
    
    var body: some View {
        ZStack{
            Image("ExhibitionViewBackGround")
                .resizable()
                .ignoresSafeArea()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            
            VStack {
                HStack {
//                    Text("좋아하는 사진 모음")
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
            
                HStack{
                    ForEach(0..<favorites.count) { num in
                        VStack {
                            AsyncImage(url: URL(string: favorites[num].imageURL!)){ image in
                                image
                                    .resizable()
                                    .frame(width: 160, height: 160, alignment: .trailing)
                                    .aspectRatio(contentMode: .fit)
                                    .border(Color.black, width: 8)
                            } placeholder: {
                                ProgressView()
                                    .progressViewStyle(.circular)
                            }
                            Text(favorites[num].name!)
                                .foregroundColor(.black)
                                .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
                                .background(Rectangle().fill(Color.white))
                                .multilineTextAlignment(.trailing)
                        }
                    }
                }
            }
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .leading)
        }
    }
}
