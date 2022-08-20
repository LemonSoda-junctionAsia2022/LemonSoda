//
//  popupView.swift
//  JunctionAsia_Lomon_Soda
//
//  Created by 지준용 on 2022/08/20.
//

import SwiftUI

struct popupView: View {
    
    var body: some View {
        ZStack{
            Color.black
                .ignoresSafeArea()
                .opacity(0.2)
            
            ZStack{
                VStack {
                    ScrollView(showsIndicators: false) {
                        HStack {
                            Text("좋아하는 작품 모음")
                                .font(.system(size: 22, weight: .bold))
                            Spacer()
                        }
                        
                        ForEach(0..<4) {_ in
                            HStack(spacing: 40) {
                                
                                ForEach(0..<3){_ in
                                    VStack {
                                        Image("testImage")
                                            .resizable()
                                            .frame(width: 160, height: 160)
                                            .aspectRatio(contentMode: .fit)
                                        Text("작가 이름 / 작품이름")
                                            .font(.system(size: 16, weight: .bold))
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}



struct popupView_Previews: PreviewProvider {
    static var previews: some View {
        popupView()
    }
}
