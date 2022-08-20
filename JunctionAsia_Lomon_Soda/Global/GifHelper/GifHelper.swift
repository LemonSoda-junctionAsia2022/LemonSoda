//
//  GifHelper.swift
//  JunctionAsia_Lomon_Soda
//
//  Created by LeeJiSoo on 2022/08/21.
//

import UIKit
import SwiftUI
import FLAnimatedImage

// MARK: - GifView(fileName: "rabbit") 로 사용하세요.

struct GifView: UIViewRepresentable {

    let animatedView = FLAnimatedImageView()
    var fileName: String

    func makeUIView(context: UIViewRepresentableContext<GifView>) -> UIView {
        let view = UIView()

        let path: String = Bundle.main.path(forResource: fileName, ofType: "gif")!
        let url = URL(fileURLWithPath: path)
        let gifData = try! Data(contentsOf: url)

        let gif = FLAnimatedImage(animatedGIFData: gifData)
        animatedView.animatedImage = gif

        animatedView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animatedView)

        NSLayoutConstraint.activate([
            animatedView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animatedView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])

        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) { }
}
