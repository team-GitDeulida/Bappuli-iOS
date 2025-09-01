//
//  Font.swift
//  Bappuli
//
//  Created by 김동현 on 9/2/25.
//

import SwiftUI

enum AppFont: String {
    case mitmi = "Ownglyph_meetme-Rg"
}

extension Font {
    static func mitmi(size: CGFloat) -> Font {
        .custom(AppFont.mitmi.rawValue, size: size)
    }
}
