//
//  Font+Extension.swift
//  JunctionAsia_Lomon_Soda
//
//  Created by LeeJiSoo on 2022/08/21.
//

import SwiftUI

extension Font {
    struct DungGeumMo {
        let title = Font.custom("DungGeumMo", size: 60)
        let subtitle = Font.custom("DungGeumMo", size: 24)
        let favoritesButton = Font.custom("DungGeumMo", size: 30)
        let visitationButton = Font.custom("DungGeumMo", size: 30)
    }

    static let dunggeummo = DungGeumMo()
}
