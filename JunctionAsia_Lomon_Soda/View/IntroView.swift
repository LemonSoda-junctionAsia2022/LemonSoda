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
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
