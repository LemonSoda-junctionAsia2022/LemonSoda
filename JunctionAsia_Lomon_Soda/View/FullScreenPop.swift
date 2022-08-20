//
//  FullScreenPop.swift
//  JunctionAsia_Lomon_Soda
//
//  Created by 김민택 on 2022/08/20.
//

import Foundation
import SwiftUI

struct FullScreenPop: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }, label: {
            Text("당장 닫아")
        })
    }
}
