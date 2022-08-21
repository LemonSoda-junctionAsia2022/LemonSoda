//
//  ArtWorkDetailView.swift
//  JunctionAsia_Lomon_Soda
//
//  Created by 지준용 on 2022/08/21.
//

import SwiftUI

struct ArtWorkDetailView: View {
    @Binding var isShowingInfo: Bool
    @Binding var isShowingFavorite: Bool
    @State var likeColor = false
    var artWorkInformation: UnitDatum?
    var permalinkDefault = "https://opensea.io/assets/ethereum/0x932261f9fc8da46c4a22e31b45c4de60623848bf/52529"
    
    @FetchRequest(entity: Liked.entity(), sortDescriptors: [])
    var liked: FetchedResults<Liked>
    
    var body: some View {
        ZStack {
            Color.white
            Color.mint.ignoresSafeArea()
            
            VStack(spacing: 20) {
                HStack {
                    Spacer()
                    Button(action: {
                        isShowingInfo = false
                    }, label: {
                        Image(systemName: "xmark")
                            .padding(.trailing, 20)
                    })
                }
                
                HStack(spacing: 20) {
                    VStack(spacing: 10) {
                        AsyncImage(url: URL(string: artWorkInformation?.imageURL ?? "")){ image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 200,
                                       height: 200,
                                       alignment: .center)
                        } placeholder: {
                            ProgressView()
                                .progressViewStyle(.circular)
                        }
                        
                        Text(artWorkInformation?.name ?? "")
                            .frame(width: 180, height: 20, alignment: .trailing)
                            .foregroundColor(.black)
                            .padding(5)
                            .font(.system(size: 14, weight: .semibold))
                            .background(Rectangle().fill(Color.white))
                    }
                    
                    VStack{
                        VStack(alignment: .leading, spacing: 10) {
                            HStack {
                                VStack(alignment: .leading, spacing: 10){
                                    HStack{
                                        Text("NFT ID:")
                                            .font(.system(size: 20, weight: .black))
                                            .foregroundColor(.mainBlue)
                                        Text("\(artWorkInformation!.id)")
                                    }
                                    HStack{
                                        Text("Creator:")
                                            .font(.system(size: 20, weight: .black))
                                            .foregroundColor(.mainBlue)
                                        Text(artWorkInformation?.creator.address ?? "Unknown")
                                    }
                                    HStack{
                                        Text("CreatedDate :")
                                            .font(.system(size: 20, weight: .black))
                                            .foregroundColor(.mainBlue)
                                        Text(artWorkInformation?.collection.createdDate ?? "Unknown")
                                    }
                                    HStack{
                                        Text("Short Description:")
                                            .foregroundColor(.mainBlue)
                                            .font(.system(size: 20, weight: .black))
                                        Text(artWorkInformation?.collection.collectionDescription ?? "Unknown")
                                    }
                                }
                                .padding(.top, 40)
                                .padding(.leading, 30)
                                .padding(.trailing, 15)
                            }
                            Spacer()
                        }
                        .frame(width: 420, height: 195, alignment: .leading)
                        .background(.white)
                        .cornerRadius(10)
                        HStack(spacing: 20) {
                            if !likeColor {
                                Button(action: {
                                    isShowingFavorite = true
//                                    favorites.append(artWorkInformation!)
                                    likeColor.toggle()
    //                                coreDataManager.createLikeData(jsonObject: )
                                }, label: {
                                    Text("Like  ♥︎")
                                        .foregroundColor(.buttonTextGray)
                                })
                                .frame(width: 200, height: 40, alignment: .center)
                                .background(Rectangle().fill(Color.buttonGray))
                            } else {
                                Button(action: {
                                    isShowingFavorite = false
//                                    favorites.append(artWorkInformation!)
                                    likeColor.toggle()
    //                                coreDataManager.createLikeData(jsonObject: )
                                }, label: {
                                    Text("Like  ♥︎")
                                        .foregroundColor(.white)
                                })
                                .frame(width: 200, height: 40, alignment: .center)
                                .background(Rectangle().fill(Color.magentaPink))
                            }
                            
                            
                            Link(destination: URL(string: permalinkDefault)!) {
                                Text("More Details and Buy")
                                    .foregroundColor(.white)
                            }
                            .frame(width: 200, height: 40, alignment: .center)
                            .background(Rectangle().fill(Color.mainBlue))
                        }
                        .fullScreenCover(isPresented: $isShowingFavorite) {
                            PopupView(isShowingFavorite: $isShowingFavorite)
                        }
                    }
                }
            }
            .padding(.bottom, 20)
            .padding(.horizontal, 16)
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
    }
}

