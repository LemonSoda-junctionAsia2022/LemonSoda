//
//  MainView.swift
//  JunctionAsia_Lomon_Soda
//
//  Created by 지준용 on 2022/08/20.
//

import SwiftUI

struct MainView: View {
    @State private var artWorks: [UnitDatum] = load("NFTDataSet.json")
    @State private var isShowingFavorite = false
    @State private var isShowingInfo = false
    @State private var arts: [UnitDatum] = [UnitDatum]()
    var height: CGFloat = 2
    
    var body: some View {
        ZStack {
            Image("ExhibitionViewBackGround")
                .resizable()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
            
            VStack {
//                Button(action: {
//                    isShowingFavorite = true
//                }, label: {
//                    Text("버튼")
//                })
                HStack(spacing: 80) {
                    ForEach(artWorks, id: \.id) { artWork in
                        if artWork.imageURL?.isEmpty == false {
                            VStack(spacing: 20) {
                                Button(action: {
                                    isShowingInfo = true
                                }, label: {
                                    AsyncImage(url: URL(string: artWork.imageThumbnailURL ?? "")){ image in
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 160,
                                                   height: 160,
                                                   alignment: .center)
                                    } placeholder: {
                                        ProgressView()
                                            .progressViewStyle(.circular)
                                    }
                                })

                                Text("\(artWork.name ?? "")")
                                    .background(Rectangle().fill(Color.clear)
                                        .border(Color.gray)
                                    )
                            }
                        }
                    }
                }
                .edgesIgnoringSafeArea(.horizontal)
            }
            rabbit()
            if isShowingFavorite {
                PopupView(isShowingFavorite: $isShowingFavorite)
            } else if isShowingInfo {
                ArtWorkDetailView(isShowingInfo: $isShowingInfo)
            }
        }
    }

    private func rabbit() -> some View {
        GifView(fileName: "rabbit")
            .frame(width: 450, height: 225, alignment: .center)
            .offset(x: -300, y: 80)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
