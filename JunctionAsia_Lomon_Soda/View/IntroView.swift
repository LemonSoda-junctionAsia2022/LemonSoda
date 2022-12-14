//
//  IntroView.swift
//  JunctionAsia_Lomon_Soda
//
//  Created by Jisu Jang on 2022/08/21.
//

import SwiftUI

struct IntroView: View {
    @State var isShowingFavorite = false
    
    var body: some View {
        ZStack{
            Image("MainViewBackGround")
                .resizable()
                .ignoresSafeArea()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            
            rabbit()
            
            VStack(spacing: 10){
                Text("NFiTion")
                    .font(.dunggeummo.title)
                    .foregroundColor(Color.mainTitleGreen)
                
                Text("NFT Exhibition X Junction Asia 2022")
                    .font(.dunggeummo.subtitle)
                    .foregroundColor(Color.mainTitleGreen)
                    .padding(.bottom, 45)

                HStack (spacing: 28){
                    NavigationLink(destination: PopupView(isShowingFavorite: $isShowingFavorite).navigationBarHidden(true)) {
                        Text("FAVORITES")
                            .padding(EdgeInsets(top: 8, leading: 55, bottom: 8, trailing: 55))
                            .background(Color.backgroundBlue)
                            .font(.dunggeummo.favoritesButton)
                            .foregroundColor(Color.magentaPink)
                    }

                    NavigationLink(destination: MainView(isShowingFavorite: $isShowingFavorite).navigationBarHidden(true)) {
                        Text("VISITATION")
                            .padding(EdgeInsets(top: 8, leading: 55, bottom: 8, trailing: 55))
                            .background(Color.backgroundBlue)
                            .font(.dunggeummo.visitationButton)
                            .foregroundColor(Color.mainBlue)
                    }
                }
            }
        }
    }

    private func rabbit() -> some View {
        Image("stopRabbit")
            .resizable()
            .frame(width: 274, height: 203, alignment: .center)
            .offset(x: -300, y: 50)
    }
}
