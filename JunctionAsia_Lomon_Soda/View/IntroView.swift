//
//  IntroView.swift
//  JunctionAsia_Lomon_Soda
//
//  Created by Jisu Jang on 2022/08/21.
//

import SwiftUI

struct IntroView: View {
    var body: some View {
        ZStack{
            Image("MainViewBackGround")
                .resizable()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
            rabbit()
            VStack(spacing: 10){
                Text("NFiTion")
                    .font(.dunggeummo.title)
                    .foregroundColor(Color.mainTitleGreen)
                Text("NFT Exhibition X Junction Asia 2022")
                    .font(.dunggeummo.subtitle)
                    .foregroundColor(Color.mainTitleGreen)

                HStack {
                    NavigationLink(destination: MainView().navigationBarHidden(true)) {
                        Text("START")
                            .bold()
                            .padding(10)
                            .foregroundColor(.black)
                            .cornerRadius(10)
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

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
