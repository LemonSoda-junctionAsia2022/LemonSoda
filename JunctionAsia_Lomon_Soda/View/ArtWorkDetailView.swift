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
    @State private var isClicked: Bool = false
    var artWorkInformation: UnitDatum?
    
    var body: some View {
        ZStack {
            Color.white
            Color.mint.ignoresSafeArea()
            
            VStack(spacing: 20) {
                xmarkButton()
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
                        VStack(alignment: .leading, spacing: 100) {
                            ScrollView {
                                VStack(alignment: .leading, spacing: 10){
                                    descriptionLabel(title: "NFT ID:", content: "\(artWorkInformation!.id)")
                                    descriptionLabel(title: "Creator:", content: artWorkInformation?.creator.user?.username ?? "Unknown")
                                    descriptionLabel(title: "CreatedDate: ", content: String(artWorkInformation?.collection.createdDate.dropLast(16) ?? "Unknown"))
                                    VStack (alignment: .leading, spacing: 10){
                                        Text("Short Description:")
                                            .font(.dunggeummo.subtitle)
                                            .foregroundColor(.mainBlue)
                                        Text(artWorkInformation?.collection.collectionDescription ?? "Unknown")
                                    }
                                }
                                .padding(EdgeInsets(top: 30, leading: 30, bottom: 30, trailing: 30  ))
                            }
                        }
                        .frame(width: 420, height: 195, alignment: .leading)
                        .background(.white)
                        .cornerRadius(10)
                        
                        HStack(spacing: 20) {
                                Button(action: {
                                    isShowingFavorite = true
                                    favorites.append(artWorkInformation!)
                                    isClicked.toggle()
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
                .padding(.bottom, 20)
                .padding(.horizontal, 16)
            }
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
        }
    }

    private func descriptionLabel(title: String, content: String) -> some View {
        HStack{
            Text(title)
                .font(.dunggeummo.subtitle)
                .foregroundColor(.mainBlue)
            Text(content)
        }
    }

    private func xmarkButton() -> some View {
        HStack {
            Spacer()
            Button(action: {
                isShowingInfo = false
            }, label: {
                Image(systemName: "xmark")
                    .padding(.trailing, 20)
            })
        }
        .padding(.horizontal, 30)
    }
}
