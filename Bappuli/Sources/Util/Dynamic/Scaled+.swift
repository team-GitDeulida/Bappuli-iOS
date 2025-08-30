//
//  scaled.swift
//  Bappuli
//
//  Created by 김동현 on 8/31/25.
//

import SwiftUI

extension CGFloat {
    var scaled: CGFloat {
        return DynamicSize.scaledSize(self)
    }
}

extension Int {
    var scaled: CGFloat {
        return DynamicSize.scaledSize(CGFloat(self))
    }
}

extension Double {
    var scaled: CGFloat {
        return DynamicSize.scaledSize(CGFloat(self))
    }
}
