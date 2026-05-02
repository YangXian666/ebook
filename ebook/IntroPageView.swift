import SwiftUI

struct IntroPageView: View {
    var body: some View {
        NavigationView {
            ZStack{
                Image("court") // 確保 Assets 裡有這張圖
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                // 這裡建議加一個稍微重一點的遮罩，否則內容會很難閱讀
                    .overlay(Color.black.opacity(0.7))
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        // 頂部橫幅圖片
                        ZStack(alignment: .bottomLeading) {
                            Image("nba_stadium") // 替換成你的圖片名稱
                                .resizable()
                                .scaledToFill() // 填滿空間
                                .frame(height: 200)
                                .clipShape(RoundedRectangle(cornerRadius: 20)) // 圓角裁切
                                .overlay(
                                    // 加上一層半透明黑色遮罩，確保文字清晰
                                    Color.black.opacity(0.3)
                                        .cornerRadius(20)
                                )
                            
                            VStack(alignment: .leading) {
                                Text("NBA 2026")
                                    .font(.system(size: 40, weight: .black, design: .rounded))
                                    .foregroundColor(.white)
                            }
                            .padding()
                        }
                        .padding(.horizontal)
                        
                        SectionView(title: "關於國家籃球協會", content: "NBA 是全球頂尖的男子職業籃球聯賽，由 30 支球隊組成（29 支在美國，1 支在加拿大）。它是世界四大職業體育聯盟之一。")
                        
                        // 快速資訊卡片
                        Text("熱門球星")
                            .font(.title2)
                            .bold()
                            .padding(.horizontal)
                            .foregroundColor(.white)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 15) {
                                // 使用 ForEach 遍歷陣列
                                ForEach(players) { player in
                                    PlayerCardView(player: player)
                                }
                            }
                            .padding(.horizontal)
                        }
                        
                        // 聯盟結構
                        SectionView(title: "聯盟結構", content: "NBA 分為東岸 (Eastern Conference) 與西岸 (Western Conference)，每個聯盟各有 15 支球隊。")
                    }
                    .padding(.vertical)
                }
            }.navigationTitle("NBA 簡介")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarColorScheme(.dark, for: .navigationBar)
        }
    }
}

struct PlayerCardView: View {
    let player: Player
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            // 1. 底層圖片背景
            Image(player.imageName)
                .resizable()
                .scaledToFill() // 確保圖片填滿整個框架
                .frame(width: 150, height: 300)
                .clipped() // 裁切超出框架的部分
            
            // 2. 漸層遮罩（讓底部的文字更清楚）
            LinearGradient(
                gradient: Gradient(colors: [.clear, .black.opacity(0.8)]),
                startPoint: .top,
                endPoint: .bottom
            )
            
            // 3. 上層文字資訊
            VStack(alignment: .leading, spacing: 4) {
                Text(player.name)
                    .font(.headline)
                    .foregroundColor(.white)
                
                Text(player.team)
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.8))
                    .padding(.horizontal, 8)
                    .padding(.vertical, 2)
                    .background(player.color.opacity(0.8)) // 隊伍標籤帶有代表色
                    .cornerRadius(5)
            }
            .padding()
        }
        .frame(width: 150, height: 300)
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 5)
    }
}// 內容區塊組件
struct SectionView: View {
    var title: String
    var content: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.title2)
                .bold()
            Text(content)
                .foregroundColor(.secondary)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(.systemGray6))
        .cornerRadius(15)
        .padding(.horizontal)
    }
}

struct Player: Identifiable {
    let id = UUID()
    let name: String
    let team: String
    let imageName: String // 這裡是 Assets 裡的圖片名稱或系統圖示名
    let color: Color
}

let players = [
    Player(name: "LeBron James", team: "Lakers", imageName: "lebron", color: .purple),
    Player(name: "Stephen Curry", team: "Warriors", imageName: "stephen", color: .blue),
    Player(name: "Kevin Durant", team: "Suns", imageName: "kevin", color: .orange),
    Player(name: "Luka Doncic", team: "Mavericks", imageName: "777", color: .cyan),
    Player(name: "Giannis Antetokounmpo", team: "Bucks", imageName: "666", color: .green)
]

#Preview {
    IntroPageView()
}


