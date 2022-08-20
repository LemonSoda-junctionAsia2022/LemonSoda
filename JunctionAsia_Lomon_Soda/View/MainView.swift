//
//  MainView.swift
//  JunctionAsia_Lomon_Soda
//
//  Created by 지준용 on 2022/08/20.
//

import SwiftUI

struct MainView: View {
    @State private var artWorks: [UnitDatum] = load("NFTDataSet.json")
    @State private var isShowing = false
    @State private var arts: [UnitDatum] = [UnitDatum]()
    var height: CGFloat = 2
    
    var body: some View {
        ZStack {
            Color.mainColor
                .ignoresSafeArea()
            
            VStack {
                Button(action: {
                    isShowing = true
                }, label: {
                    Text("버튼")
                })
                .fullScreenCover(isPresented: $isShowing){
                    popupView()
                }
                HStack(spacing: 80) {
                    ForEach(artWorks, id: \.id) { artWork in
                        VStack(spacing: 20) {
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
                            Text("\(artWork.name ?? "")")
                                .background(Rectangle().fill(Color.clear)
                                    .border(Color.gray)
                                )
                        }
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
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
