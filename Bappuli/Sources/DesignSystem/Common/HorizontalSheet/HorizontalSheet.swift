//
//  HorizontalSheet.swift
//  Bappuli
//
//  Created by 김동현 on 9/1/25.
//

import SwiftUI

// MARK: - SideMenuModifier
struct HorizontalSheet<MenuContent: View>: ViewModifier {
    @Binding var isPresented: Bool
    @State private var dragOffset: CGFloat = 0
    let menuContent: () -> MenuContent

    func body(content: Content) -> some View {
        ZStack {
            content

            GeometryReader { geo in
                HStack {
                    Spacer()
                    menuContent()
                        .frame(width: geo.size.width * 0.2,
                               height: geo.size.height)
                        .overlay(
                            Divider()
                                .frame(width: 3)
                                .background(Color.black),  // ✅ 흰색 경계선
                            alignment: .leading
                        )
                        .offset(x: (isPresented ? 0 : geo.size.width) + dragOffset)
                        .animation(.easeInOut(duration: 0.3), value: isPresented)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    if value.translation.width > 0 {
                                        dragOffset = value.translation.width
                                    }
                                }
                                .onEnded { value in
                                    if value.translation.width > 100 {
                                        isPresented = false
                                    }
                                    dragOffset = 0
                                }
                        )
                }
            }
        }
    }
}

// MARK: - View Extension
extension View {
    func hSheet<MenuContent: View>(
        isPresented: Binding<Bool>,
        @ViewBuilder content: @escaping () -> MenuContent
    ) -> some View {
        self.modifier(HorizontalSheet(isPresented: isPresented, menuContent: content))
    }
}
