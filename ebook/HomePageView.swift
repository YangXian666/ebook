// EventIntroView.swift

import SwiftUI
import WebKit

struct HomePageView: View {
    var body: some View {
        NavigationStack {
            ZStack  {
                Color.black.ignoresSafeArea(edges: .all)
                
                Image("airjordan")
                    .resizable()
                    .frame(width: 450, height: 800)
                
                
                Image("nbalogo")
                    .resizable()
                    .scaledToFit( )
                    .frame(width: 300, height: 300)
                    .padding()
                    .offset(y: -300)
                
                VStack {
                    
                    NavigationLink {
                        IntroPageView()
                    } label: {
                        HStack(spacing: 12) {
                            Image("basketballbutton")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60, height: 60)
                            
                            Text("Introduction")
                                .font(.system(size: 25, weight: .bold, design: .serif))
                                .colorInvert()
                        }
                        .font(Font.largeTitle.italic())
                        .padding(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.white, lineWidth: 4))
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea()
                    .offset(y: 380)
                    
                    NavigationLink {
                        WebView(urlString: "https://www.nba.com")
                            .navigationTitle("官方網站")
                            .navigationBarTitleDisplayMode(.inline)
                    } label: {
                        HStack {
                            Image(systemName: "safari")
                            Text("Official Website")
                        }
                        .font(Font.largeTitle.italic())
                        .foregroundStyle(Color.white)
                        .padding(8)
                        .background(Color.blue.opacity(0.8))
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.white, lineWidth: 4)
                        )
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea()
                    .offset(y: 100)
                    
                }
            }
           
        }
    }
}

struct WebView: UIViewRepresentable {
    let urlString: String

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            uiView.load(request)
        }
    }
}

#Preview {
    HomePageView()
}
