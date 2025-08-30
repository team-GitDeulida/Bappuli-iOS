//
//  dynamic.swift
//  Mallang
//
//  Created by 김동현 on 8/31/25.
//

import Foundation

public struct DynamicSize {
    // MARK: - 기준 기기 (default: iPhone 15 Pro Max)
    private static var baseSize: CGSize = BaseDevice.iPhone15ProMax.size
    private static var bounds: CGRect = CGRect(origin: .zero, size: baseSize)

    /// 앱 시작 시, 현재 디바이스 screen bounds 및 기준 디바이스를 설정
    public static func setScreenSize(_ newBounds: CGRect, baseDevice: BaseDevice = .iPhone15ProMax) {
        self.bounds = newBounds
        self.baseSize = baseDevice.size
    }

    /// 현재 기기 화면 너비
    public static var screenWidth: CGFloat { bounds.width }

    /// 현재 기기 화면 높이
    public static var screenHeight: CGFloat { bounds.height }

    /// 전체 bounds
    public static var screenBounds: CGRect { bounds }

    /// 현재 기기의 대각선 기반 스케일 비율
    public static var scaleFactor: CGFloat {
        let currentDiagonal = sqrt(screenWidth * screenWidth + screenHeight * screenHeight)
        let baseDiagonal = sqrt(baseSize.width * baseSize.width + baseSize.height * baseSize.height)
        return currentDiagonal / baseDiagonal
    }

    /// 주어진 값에 스케일 비율을 적용 (동적 크기 계산)
    public static func scaledSize(_ size: CGFloat) -> CGFloat {
        return size * scaleFactor
    }
}
