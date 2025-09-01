//
//  RecordDetail.swift
//  Bappuli
//
//  Created by 김동현 on 9/2/25.
//

import SwiftUI

struct RecordDetailView: View {
    @ObservedObject var viewModel: HomeViewModel
    @Binding var showMenu: Bool

    // MARK: - mp3 파일 불러오기
    private var musicFiles: [String] {
        let mp3Files = Bundle.main.paths(forResourcesOfType: "mp3", inDirectory: nil)
        return mp3Files.map { URL(fileURLWithPath: $0).lastPathComponent }
    }
    
    // MARK: - 파일명을 한글 이름으로 매칭
    private let musicNameMapping: [String: String] = [
        "sleepless": "잠이 안올 때",
        "funny": "기분 좋을 때",
        "rainyDay": "비가 내릴 때"
    ]
    
    private var musicTitles: [(file: String, title: String)] {
        musicFiles.compactMap { file in
            let nameWithoutExt = URL(fileURLWithPath: file).deletingPathExtension().lastPathComponent
            if let mapped = musicNameMapping[nameWithoutExt] {
                return (file, mapped)
            } else {
                return nil // 매핑 없는 파일은 제외
            }
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    showMenu = false
                } label: {
                    Image(systemName: "xmark")
                        .font(.title)
                        .foregroundStyle(.black)
                }
                
                Spacer()
                
                Text("Music")
                    .font(.mitmi(size: 24))
                    .foregroundStyle(.black)
            }
            
            ScrollView {
                LazyVStack(spacing: 18) {
                    
                    ForEach(musicTitles, id: \.file) { music in
                        let nameWithoutExt = URL(fileURLWithPath: music.file)
                            .deletingPathExtension()
                            .lastPathComponent
                        
                        Button {
                            viewModel.togglePlay(fileName: nameWithoutExt)
                            showMenu = false
                        } label: {
                            Text(music.title)
                                .font(.mitmi(size: 24))
                                .lineLimit(2)
                                .frame(maxWidth: .infinity, alignment: .center)
                        }
                        
                        .padding()
                        .background(
                            viewModel.selectedMusic == nameWithoutExt
                            ? Color.blue.opacity(0.2)
                            : Color.clear
                        )
                        .cornerRadius(8)
                        
                    }
                }
                .font(.title3)
                .font(.system(size: 20))
                .foregroundStyle(.black)
            }
            .padding(.top, 20)
            
            Spacer()
        }
        .padding(32)
        .background(.gray0)
        .ignoresSafeArea()
        .onAppear {
            print(musicFiles)
        }
    }
}

#Preview {
    RecordDetailView(viewModel: HomeViewModel(), showMenu: .constant(true))
}
