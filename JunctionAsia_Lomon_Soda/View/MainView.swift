//
//  MainView.swift
//  JunctionAsia_Lomon_Soda
//
//  Created by 지준용 on 2022/08/20.
//

import SwiftUI

struct MainView: View {
    @State private var artWorks : [UnitDatum] = load("NFTDataSet.json")
    var height: CGFloat = 2
    var body: some View {
        ZStack {
            Color.mainColor
                .ignoresSafeArea()
            HStack(spacing: 80) {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(artWorks, id: \.id) { artWork in
                            VStack(spacing: 20) {
                                AsyncImage(url: URL(string: artWork.imageURL ?? "")) { image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: UIScreen.main.bounds.width * 0.5, height: UIScreen.main.bounds.height * 0.25, alignment: .center)

                                } placeholder: {
                                    ProgressView()
                                        .progressViewStyle(.circular)
                                }

                                Text("\(artWork.name ?? "")")
                                    .background(Rectangle().fill(Color.clear)
                                        .border(Color.gray)
                                    )
                            }
                            .padding(.leading, 100)
                        }
                    }
                    Rectangle()
                        .foregroundColor(.yellow)
                        .frame(height: height)
                }
            }
            .edgesIgnoringSafeArea(.horizontal)
            VStack {
                Spacer()
                HStack {
                    Image(systemName: "person")
                        .resizable()
                        .frame(width: 60, height: 90)
                    Spacer()
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
