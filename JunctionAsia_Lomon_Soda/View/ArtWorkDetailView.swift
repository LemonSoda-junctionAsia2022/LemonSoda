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
    @State private var isClicked: Bool = false
    var artWorkInformation: UnitDatum?
    var permalinkDefault = "https://opensea.io/assets/ethereum/0x932261f9fc8da46c4a22e31b45c4de60623848bf/52529"
    @Environment(\.managedObjectContext) private var viewContext

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
                                .border(.black, width: 10)
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
                                        Text(artWorkInformation?.creator.user?.username ?? "Unknown")
                                    }
                                    HStack{
                                        Text("CreatedDate :")
                                            .font(.system(size: 20, weight: .black))
                                            .foregroundColor(.mainBlue)
                                        Text(artWorkInformation?.collection.createdDate.dropLast(16) ?? "Unknown")
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
                                Button(action: {
                                    isShowingFavorite = true
                                    favorites.append(artWorkInformation!)
                                    isClicked.toggle()
                                    save()
                                }, label: {
                                    Text("Like  ♥︎")
                                        .foregroundColor(isClicked ? Color.white : Color.buttonTextGray)
                                })
                                .frame(width: 200, height: 40, alignment: .center)
                                .background(Rectangle().fill(isClicked ? Color.magentaPink:Color.buttonGray))

                            Link(destination: URL(string: artWorkInformation!.permalink)!) {
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
    
    func save() {
        let add = Liked(context: self.viewContext)
        add.nftName = artWorkInformation?.name
        add.nftImage = artWorkInformation?.imageURL
        add.permalink = artWorkInformation?.permalink
        add.creator = artWorkInformation?.creator.user?.username
        add.isLiked = true
        
        try? self.viewContext.save()
    }
}

