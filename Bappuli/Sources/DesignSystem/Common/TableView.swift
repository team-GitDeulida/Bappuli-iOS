//
//  TableView.swift
//  Bappuli
//
//  Created by 김동현 on 8/30/25.
//

import SwiftUI

struct TableView: View {
    let angle: Double
    let lineWidth: CGFloat
    var body: some View {
        Diagonal(angle: Angle.degrees(angle),
                 color: Color.black,
                 lineWidth: lineWidth)
    }
}

#Preview {
    TableView(angle: -3.0, lineWidth: 3)
}
