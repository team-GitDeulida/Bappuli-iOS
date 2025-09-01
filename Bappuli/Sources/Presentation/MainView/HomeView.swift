//
//  ContentView.swift
//  Bappuli
//
//  Created by 김동현 on 8/30/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var recordViewModel = RecordViewModel()
    @State private var bappuli = Bappuli(state: .working)
    @State private var showSheet: Bool = false
    
    
    var body: some View {
        ZStack {
            // MARK: - 배경
            Color.white.ignoresSafeArea()
            
            // MARK: - 창문
            VStack {
                HStack {
                    WindowView(size: 240)
                    Spacer()
                }
                Spacer()
            }
            
            // MARK: - 책상
            VStack {
                Spacer()
                TableView(angle: -3, lineWidth: 5)
                    .padding(.bottom, 88)
            }
            .ignoresSafeArea()
            
            // MARK: - 커피
            VStack {
                Spacer()
                ImageButton(imageName: "coffee", size: 70, flipped: false) {
                    // TODO: 커피 버튼 동작
                }
            }
            .padding(.trailing, 250)
            
            // MARK: - 레코드 버튼
            VStack {
                Spacer()
                RecordButton(viewModel: recordViewModel) {
                    // recordViewModel.togglePlay()
                    showSheet.toggle()
                }
            }
            
            // MARK: - 밥풀이
            VStack {
                Spacer()
                GifRenderView(gifName: bappuli.gifName,
                              targetSize: CGSize(width: 200, height: 200))
                .frame(width: 200, height: 200)
                .padding(.bottom, 25)
            }
        }
        .overlay {
            NotesLayer(viewModel: recordViewModel)
        }
        .hSheet(isPresented: $showSheet) {
            SettingsMenuView(viewModel: recordViewModel, showMenu: $showSheet)
        }
    }
}

// MARK: - 프리뷰
#Preview(traits: .landscapeRight) {
    HomeView()
}


struct SettingsMenuView: View {
    @ObservedObject var viewModel: RecordViewModel
    @Binding var showMenu: Bool

    // MARK: - mp3 파일 불러오기
    private var musicFiles: [String] {
        let mp3Files = Bundle.main.paths(forResourcesOfType: "mp3", inDirectory: nil)
        return mp3Files.map { URL(fileURLWithPath: $0).lastPathComponent }
    }
    
    // MARK: - 파일명을 한글 이름으로 매칭
    private let musicNameMapping: [String: String] = [
        "sleepless": "잠이 안올 떄",
        "funny": "기분 좋을 때"
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
                    .font(.system(size: 20))
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
                            // showMenu = false
                        } label: {
                            Text(music.title)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding()
                                .background(
                                    viewModel.selectedMusic == nameWithoutExt
                                    ? Color.blue.opacity(0.2)
                                    : Color.clear
                                )
                                .cornerRadius(8)
                        }
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






/*
VStack {

    
//            HStack {
//
//                Button {
//                    showMenu = false
//                } label: {
//                    Image(systemName: "xmark")
//                        .font(.title)
//                        .foregroundStyle(.black)
//                }
//
//                Spacer()
//
//                Text("Music")
//                    .font(.title)
//                    .foregroundStyle(.black)
//            }
    
   
    HStack {
        Spacer()
        Text("1")
        Spacer()
    }
    
    ScrollView {
        LazyVStack(spacing: 10) {
            Text("빗소리")
            Text("파도")
            Text("클래식")
        }
        .font(.title3)
        .font(.system(size: 10))
    }
    
    
}
.padding()
.background(Color.gray0) // 메뉴 배경 색
 */
