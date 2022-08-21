//
//  PopupView.swift
//  JunctionAsia_Lomon_Soda
//
//  Created by 지준용 on 2022/08/20.
//

import SwiftUI

struct PopupView: View {
    @Binding var isShowingFavorite: Bool
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) private var dismiss

    var artWorkInformation: UnitDatum?

    var body: some View {
        ZStack{
            backgroundImage()
            popupViewLabel()

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
    }

    private func backgroundImage() -> some View {
        Image("ExhibitionViewBackGround")
            .resizable()
            .ignoresSafeArea()
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
    }

    private func popupViewLabel() -> some View {
        HStack {
            Text("FAVORITE ARTS")
                .font(.dunggeummo.subtitle)
                .foregroundColor(Color.mainBlue)
            Spacer()
            Button(action: {
                isShowingFavorite = false
                dismiss()
            }, label: {
                Image(systemName: "xmark")
                    .resizable()
                    .frame(width: 20, height: 20, alignment: .trailing)
            })
        }
        .padding(EdgeInsets(top: 40, leading: 30, bottom: 300, trailing: 40))
    }
}
