//
//  GifRenderView.swift
//  Bappuli
//
//  Created by 김동현 on 8/30/25.
//

import SwiftUI

// MARK: - SwiftUI에서 GIF를 보여주기 위한 UIViewRepresentable
// UIKit의 UIImageView를 래핑하여 SwiftUI에서도 애니메이션 GIF를 재생 가능하게 만든다.
struct GifRenderView: UIViewRepresentable {
    let gifName: String        // 불러올 gif 파일 이름 (Bundle에 포함된 파일)
    let targetSize: CGSize     // 각 프레임을 리사이즈할 크기

    // MARK: - UIKit 뷰 생성
    func makeUIView(context: Context) -> UIImageView {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit   // 비율 유지하면서 맞춤
        imageView.clipsToBounds = true            // 뷰 범위를 벗어나면 잘라내기
        imageView.backgroundColor = .clear        // 배경은 투명
        return imageView
    }

    // MARK: - SwiftUI 상태 변경 시 호출 → UIImageView 업데이트
    func updateUIView(_ uiView: UIImageView, context: Context) {
        // 기존 애니메이션 중지 (같은 뷰가 다시 그려질 때 중복 실행 방지)
        uiView.stopAnimating()
        
        // 1. Bundle에서 gif 파일 읽기
        if let path = Bundle.main.path(forResource: gifName, ofType: "gif"),
           let data = NSData(contentsOfFile: path),
           let source = CGImageSourceCreateWithData(data, nil) {

            var images: [UIImage] = []
            let count = CGImageSourceGetCount(source)  // 프레임 수 가져오기

            // 2. 각 프레임을 UIImage로 변환
            for i in 0..<count {
                if let cgImage = CGImageSourceCreateImageAtIndex(source, i, nil) {
                    let original = UIImage(cgImage: cgImage)
                    
                    // 3. 프레임을 targetSize 크기로 리사이즈
                    let renderer = UIGraphicsImageRenderer(size: targetSize)
                    let resized = renderer.image { _ in
                        original.draw(in: CGRect(origin: .zero, size: targetSize))
                    }
                    images.append(resized)
                }
            }

            // 4. UIImageView에 애니메이션 이미지 등록
            uiView.animationImages = images
            uiView.animationDuration = Double(count) / 1.0 // GIF를 초당 1프레임(1fps) 속도
            
            // 5. 애니메이션 시작
            uiView.startAnimating()
        }
    }
}


#Preview {
    GifRenderView(gifName: "character",
                  targetSize: CGSize(width: 80, height: 80))
    .frame(width: 200, height: 200)
}
