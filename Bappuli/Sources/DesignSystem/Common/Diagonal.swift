//
//  Diagonal.swift
//  Bappuli
//
//  Created by 김동현 on 8/30/25.
//

import SwiftUI

struct Diagonal: View {
    var angle: Angle
    var color: Color = .black
    var lineWidth: CGFloat = 2
    
    var body: some View {
        Rectangle()
            .fill(color)
            .frame(height: lineWidth)
            .rotationEffect(angle)
    }
}

#Preview {
    Diagonal(angle: Angle.degrees(45),
                color: Color.black,
                lineWidth: 3)
}
