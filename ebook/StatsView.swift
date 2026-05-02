import SwiftUI

struct PlayerStats: Identifiable {
    let id = UUID()
    let name: String
    let team: String
    let value: Double
    let imageName: String // 這裡放球員照片名稱
    let rank: Int
}

// --- 1. 補全所有數據資料 ---
let scoringLeaders = [
    PlayerStats(name: "Luka Doncic", team: "Mavericks", value: 33.9, imageName: "luka", rank: 1),
    PlayerStats(name: "Shai Gilgeous-Alexander", team: "Thunder", value: 30.1, imageName: "shai", rank: 2),
    PlayerStats(name: "Giannis Antetokounmpo", team: "Bucks", value: 30.4, imageName: "giannis", rank: 3)
]

let assistLeaders = [
    PlayerStats(name: "Tyrese Haliburton", team: "Pacers", value: 10.9, imageName: "tyrese", rank: 1),
    PlayerStats(name: "Trae Young", team: "Hawks", value: 10.8, imageName: "trae", rank: 2),
    PlayerStats(name: "Luka Doncic", team: "Mavericks", value: 9.8, imageName: "luka", rank: 3)
]

let reboundLeaders = [
    PlayerStats(name: "Domantas Sabonis", team: "Kings", value: 13.7, imageName: "sabonis", rank: 1),
    PlayerStats(name: "Rudy Gobert", team: "Timberwolves", value: 12.9, imageName: "gobert", rank: 2),
    PlayerStats(name: "Anthony Davis", team: "Lakers", value: 12.6, imageName: "ad", rank: 3)
]

let blockLeaders = [
    PlayerStats(name: "Victor Wembanyama", team: "Spurs", value: 3.6, imageName: "wemby", rank: 1),
    PlayerStats(name: "Walker Kessler", team: "Jazz", value: 2.4, imageName: "kessler", rank: 2),
    PlayerStats(name: "Brook Lopez", team: "Bucks", value: 2.4, imageName: "lopez", rank: 3)
]

struct StatsView: View {
    @State private var selectedStat = "得分"
    let categories = ["得分", "助攻", "籃板", "阻攻"]

    // --- 2. 新增一個計算屬性，用來決定現在要顯示哪一組資料 ---
    var currentDisplayData: [PlayerStats] {
        switch selectedStat {
        case "得分": return scoringLeaders
        case "助攻": return assistLeaders
        case "籃板": return reboundLeaders
        case "阻攻": return blockLeaders
        default: return scoringLeaders
        }
    }

    var body: some View {
        NavigationView {
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)
                
                Image("100point")
                    .resizable()
                    // 建議改為更穩定的佈局方式
                    .scaledToFill()
                    .frame(width: 410, height: 600)
                    .ignoresSafeArea()
                    .overlay(Color.black.opacity(0.7))

                VStack {
                    Picker("數據類別", selection: $selectedStat) {
                        ForEach(categories, id: \.self) { category in
                            Text(category).tag(category)
                        }
                    }
                    .pickerStyle(.segmented)
                    .padding()
                    // 這裡稍微降低透明度，讓選取器看起來更專業
                    .background(Color.white.opacity(0.6))
                    .cornerRadius(8)
                    .padding(.horizontal)

                    List {
                        // --- 3. 這裡改用計算出來的動態資料 ---
                        ForEach(currentDisplayData) { player in
                            LeaderRow(player: player, statUnit: getUnit())
                        }
                        .listRowBackground(
                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color.white.opacity(0.1))
                                .padding(.vertical, 5)
                        )
                        .listRowSeparator(.hidden)
                    }
                    .scrollContentBackground(.hidden)
                    .listStyle(.plain)
                }
            }
            .navigationTitle("數據排行榜")
            .toolbarColorScheme(.dark, for: .navigationBar)
        }
    }

    func getUnit() -> String {
        switch selectedStat {
        case "得分": return "PPG"
        case "助攻": return "APG"
        case "籃板": return "RPG"
        case "阻攻": return "BPG" // 補上阻攻單位
        default: return "AVG"
        }
    }
}
// 3. 自定義的排行榜每一行 (LeaderRow)
struct LeaderRow: View {
    let player: PlayerStats
    let statUnit: String

    var body: some View {
        HStack(spacing: 15) {
            // 名次
            Text("\(player.rank)")
                .font(.system(.title3, design: .rounded))
                .italic()
                .fontWeight(.black)
                .foregroundColor(.orange)
                .frame(width: 30)

            Image(player.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)

            VStack(alignment: .leading) {
                Text(player.name)
                    .font(.headline)
                    .foregroundColor(.white)
                Text(player.team)
                    .font(.caption)
                    .foregroundColor(.white)
            }

            Spacer()

            // 數據數值
            VStack(alignment: .trailing) {
                Text("\(player.value, specifier: "%.1f")")
                    .font(.system(.title3, design: .monospaced))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Text(statUnit)
                    .font(.caption2)
                    .foregroundColor(.orange)
            }
        }
        .padding(.vertical, 8)
    }
}

#Preview {
    StatsView()
}
