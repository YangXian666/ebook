import SwiftUI

struct Matchup: Identifiable {
    let id = UUID()
    let team1: String
    let team2: String
    let score1: Int
    let score2: Int
    let status: String
}

struct BracketView: View {
    var body: some View {
        NavigationView {
            ZStack {
                // 背景圖
                Image("playoff")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .overlay(Color.black.opacity(0.6))

                ScrollView([.horizontal, .vertical], showsIndicators: false) {
                    HStack(spacing: 30) {
                        
                        // --- 1. 西區第一輪 (最左) ---
                        VStack(spacing: 40) {
                            Text("西區首輪").foregroundColor(.blue).bold()
                            MatchupBox(team1: "Thunder", score1: 4, team2: "Pelicans", score2: 0, width: 140)
                            MatchupBox(team1: "Clippers", score1: 2, team2: "Mavericks", score2: 4, width: 140)
                            MatchupBox(team1: "Timberwolves", score1: 4, team2: "Suns", score2: 0, width: 140)
                            MatchupBox(team1: "Nuggets", score1: 4, team2: "Lakers", score2: 1, width: 140)
                        }

                        // --- 2. 西區準決賽 ---
                        VStack(spacing: 120) {
                            Text("西區準決賽").foregroundColor(.blue).bold()
                            MatchupBox(team1: "Thunder", score1: 2, team2: "Mavericks", score2: 4, width: 140)
                            MatchupBox(team1: "Timberwolves", score1: 4, team2: "Nuggets", score2: 3, width: 140)
                        }.offset(y:-35)

                        // --- 3. 西區決賽 ---
                        VStack(spacing: 160) {
                            Text("西區決賽").foregroundColor(.blue).bold()
                            MatchupBox(team1: "Mavericks", score1: 4, team2: "Timberwolves", score2: 1, width: 140)
                        }.offset(y:-50)

                        // --- 4. 總決賽 (中央) ---
                        VStack(spacing: 20) {
                            Image(systemName: "trophy.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .foregroundColor(.yellow)
                                .shadow(color: .yellow.opacity(0.5), radius: 15)
                            
                            Text("NBA FINALS")
                                .font(.system(size: 24, weight: .black))
                                .foregroundColor(.white)
                            
                            // 總決賽對陣框
                            VStack(spacing: 0) {
                                Text("THE CHAMPIONSHIP").font(.caption2).foregroundColor(.orange).padding(.top, 5)
                                MatchupBox(team1: "Mavericks", score1: 1, team2: "Celtics", score2: 4, width: 180)
                            }
                            .background(Color.orange.opacity(0.2))
                            .cornerRadius(12)
                        }
                        .padding(.horizontal, 40)
                        .offset(y:-50)

                        // --- 5. 東區決賽 ---
                        VStack(spacing: 160) {
                            Text("東區決賽").foregroundColor(.green).bold()
                            MatchupBox(team1: "Celtics", score1: 4, team2: "Pacers", score2: 0, width: 140)
                        }
                        .offset(y:-50)

                        // --- 6. 東區準決賽 ---
                        VStack(spacing: 120) {
                            Text("東區準決賽").foregroundColor(.green).bold()
                            MatchupBox(team1: "Celtics", score1: 4, team2: "Cavaliers", score2: 1, width: 140)
                            MatchupBox(team1: "Knicks", score1: 3, team2: "Pacers", score2: 4, width: 140)
                        }.offset(y:-35)

                        // --- 7. 東區第一輪 (最右) ---
                        VStack(spacing: 40) {
                            Text("東區首輪").foregroundColor(.green).bold()
                            MatchupBox(team1: "Celtics", score1: 4, team2: "Heat", score2: 1, width: 140)
                            MatchupBox(team1: "Cavaliers", score1: 4, team2: "Magic", score2: 3, width: 140)
                            MatchupBox(team1: "Knicks", score1: 4, team2: "76ers", score2: 2, width: 140)
                            MatchupBox(team1: "Bucks", score1: 2, team2: "Pacers", score2: 4, width: 140)
                        }
                    }
                    .padding(60)
                }
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("NBA 2026季後賽")
                        .font(.system(size: 36, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                        .offset(y: 100)
                }
            }
        }
    }
}

// 通用的對陣組件 (加入可變寬度)
struct MatchupBox: View {
    let team1: String
    let score1: Int
    let team2: String
    let score2: Int
    var width: CGFloat = 150
    
    var body: some View {
        VStack(spacing: 0) {
            // 上方隊伍
            HStack {
                Text(team1).font(.system(size: 14, weight: .medium))
                Spacer()
                Text("\(score1)").font(.system(.body, design: .monospaced)).bold()
            }
            .padding(.horizontal, 12)
            .frame(width: width, height: 40)
            .background(score1 > score2 ? Color.orange.opacity(0.6) : Color.white.opacity(0.1))
            
            Divider().background(Color.white.opacity(0.2))
            
            // 下方隊伍
            HStack {
                Text(team2).font(.system(size: 14, weight: .medium))
                Spacer()
                Text("\(score2)").font(.system(.body, design: .monospaced)).bold()
            }
            .padding(.horizontal, 12)
            .frame(width: width, height: 40)
            .background(score2 > score1 ? Color.orange.opacity(0.6) : Color.white.opacity(0.1))
        }
        .foregroundColor(.white)
        .cornerRadius(8)
        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.white.opacity(0.15), lineWidth: 1))
    }
}

#Preview {
    BracketView()
}
