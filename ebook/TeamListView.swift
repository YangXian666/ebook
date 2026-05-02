import SwiftUI

struct Team: Identifiable {
    let id = UUID()
    let name: String
    let city: String
    let conference: String // 東岸或西岸
    let championships: Int // 奪冠次數
    let description: String
    let color: Color
    let logoImage: String // 隊徽名稱
}

let nbaTeams = [
    // --- 西區聯盟 (Western Conference) ---
    Team(name: "Lakers", city: "Los Angeles", conference: "Western", championships: 17, description: "湖人隊是 NBA 歷史上最成功的球隊之一，擁有深厚的贏球傳統。從「魔術」強森到柯比·布萊恩，再到勒布朗·詹姆斯，這裡始終是星光熠熠的籃球殿堂。", color: .purple, logoImage: "1"),
    
    Team(name: "Warriors", city: "Golden State", conference: "Western", championships: 7, description: "勇士隊在過去十年中開創了「小球時代」，憑藉著史蒂芬·柯瑞的革命性三分球與精妙的團隊傳導，成為現代籃球進攻的教科書。", color: .blue, logoImage: "2"),
    
    Team(name: "Suns", city: "Phoenix", conference: "Western", championships: 0, description: "太陽隊以華麗的進攻著稱。雖然隊史尚缺一座總冠軍，但從納許時代的 7 秒進攻到現在的明星三巨頭，他們一直是西區最具觀賞性的隊伍。", color: .orange, logoImage: "3"),
    
    Team(name: "Nuggets", city: "Denver", conference: "Western", championships: 1, description: "地處高海拔的丹佛金塊，在「小丑」約基奇的帶領下，展現了中鋒作為組織核心的極致戰術。他們在 2023 年證明了耐心建隊也能奪冠。", color: .blue, logoImage: "4"),
    
    Team(name: "Mavericks", city: "Dallas", conference: "Western", championships: 1, description: "獨行俠隊（原小牛隊）擁有強大的外籍球星傳統。從德佬諾威斯基的優雅金雞獨立，到現在盧卡·唐西奇的全面統治力，是西區不可忽視的進攻強權。", color: .blue, logoImage: "5"),
    
    Team(name: "Spurs", city: "San Antonio", conference: "Western", championships: 5, description: "馬刺隊是職業運動的典範。在波波維奇教練的帶領下，以低調、團隊與極致的紀律著稱，現在則正圍繞著天才新星文班亞馬重啟王朝夢想。", color: .gray, logoImage: "6"),
    
    Team(name: "Clippers", city: "Los Angeles", conference: "Western", championships: 0, description: "洛杉磯快艇隊近年透過強大的財力與星度轉型為奪冠熱門，長期與湖人隊共用主場後，現在正努力建立屬於自己的球隊文化與主場尊嚴。", color: .red, logoImage: "7"),
    
    Team(name: "Kings", city: "Sacramento", conference: "Western", championships: 1, description: "國王隊在歷經長期的季後賽荒後，近年透過奔放的「點亮光束（Light the Beam）」文化重返強權行列，以極速的進攻節奏令對手畏懼。", color: .purple, logoImage: "8"),
    
    Team(name: "Grizzlies", city: "Memphis", conference: "Western", championships: 0, description: "曼非斯灰熊隊以「磨礪與奮鬥（Grit and Grind）」的強韌精神聞名，雖然現在球風變得更年輕且具爆發力，但那種不服輸的防守韌性依然存在。", color: .blue, logoImage: "9"),
    
    Team(name: "Pelicans", city: "New Orleans", conference: "Western", championships: 0, description: "鵜鶘隊擁有一群極具天賦的年輕側翼與禁區野獸，他們展現了強大的身體對抗性，是西區球隊最不想在季後賽碰到的體力消耗戰對手。", color: .blue, logoImage: "10"),
    
    Team(name: "Timberwolves", city: "Minnesota", conference: "Western", championships: 0, description: "灰狼隊在歷經多年磨練後，建立起全聯盟最令人窒息的雙塔防守體系，搭配年輕新星愛德華茲的爆發力，正朝著隊史首座冠軍邁進。", color: .blue, logoImage: "11"),
    
    Team(name: "Thunder", city: "Oklahoma City", conference: "Western", championships: 1, description: "雷霆隊是聯盟中「選秀眼光」的代名詞。他們透過精準的選秀蒐集了大量天賦球員，正以全聯盟最年輕且最具活力的陣容震驚世人。", color: .blue, logoImage: "12"),
    
    Team(name: "Rockets", city: "Houston", conference: "Western", championships: 2, description: "火箭隊在 90 年代由歐拉朱萬帶領蟬聯兩冠。經歷過哈登的得分傳奇後，現在正處於一群潛力新星接棒的成長階段。", color: .red, logoImage: "13"),
    
    Team(name: "Jazz", city: "Utah", conference: "Western", championships: 0, description: "猶他爵士隊以堅不可摧的主場氛圍著稱。無論陣容如何更迭，他們始終保持著極高的戰術執行力與團隊合作精神。", color: .indigo, logoImage: "14"),
    
    Team(name: "Trail Blazers", city: "Portland", conference: "Western", championships: 1, description: "拓荒者隊擁有全 NBA 最忠誠的粉絲群。在「後利拉德時代」，他們正處於徹底重建的階段，努力尋找下一位波特蘭的救世主。", color: .red, logoImage: "15"),

    // --- 東區聯盟 (Eastern Conference) ---
    Team(name: "Celtics", city: "Boston", conference: "Eastern", championships: 18, description: "賽爾提克隊是波士頓的驕傲，擁有悠久的榮耀歷史。他們強調平衡的攻守與深厚的球隊深度，始終站在爭冠的第一線。", color: .green, logoImage: "16"),
    
    Team(name: "Bulls", city: "Chicago", conference: "Eastern", championships: 6, description: "公牛隊的標誌象徵著 90 年代的無敵。麥可·喬丹帶領的兩次三連霸讓這支球隊成為全球最知名的籃球品牌。", color: .red, logoImage: "17"),
    
    Team(name: "Bucks", city: "Milwaukee", conference: "Eastern", championships: 2, description: "密爾瓦基公鹿隊在「希臘怪物」安戴托昆波帶領下，展現了極致的禁區破壞力與防守範圍。他們證明了小市場球隊也能吸引巨星並奪冠。", color: .green, logoImage: "18"),
    
    Team(name: "Heat", city: "Miami", conference: "Eastern", championships: 3, description: "「熱火文化」是 NBA 的標籤，代表著不放棄、強悍與極致的身體鍛鍊。這讓他們多次在陣容不被看好的情況下殺進總決賽。", color: .red, logoImage: "19"),
    
    Team(name: "Knicks", city: "New York", conference: "Eastern", championships: 2, description: "尼克隊坐擁籃球聖地「麥迪遜花園」。無論戰績如何，這裡始終是聚光燈的焦點，近年透過強韌的防守風格重新贏回紐約人的心。", color: .orange, logoImage: "20"),
    
    Team(name: "76ers", city: "Philadelphia", conference: "Eastern", championships: 3, description: "費城 76 人隊代表著「過程（The Process）」。他們經歷了長期的重建，現在圍繞著頂尖中鋒恩比德建隊，是東區長年的爭冠勁旅。", color: .blue, logoImage: "21"),
    
    Team(name: "Cavaliers", city: "Cleveland", conference: "Eastern", championships: 1, description: "騎士隊在 2016 年打破了克里夫蘭半世紀的冠軍荒。現在他們擁有一支年輕且極具競爭力的後衛與雙塔陣容。", color: .red, logoImage: "22"),
    
    Team(name: "Pacers", city: "Indiana", conference: "Eastern", championships: 0, description: "溜馬隊在印第安納這個籃球之州擁有純粹的靈魂。他們目前推崇極速的快攻節奏，是全聯盟得分能力最可怕的球隊之一。", color: .yellow, logoImage: "23"),
    
    Team(name: "Magic", city: "Orlando", conference: "Eastern", championships: 0, description: "奧蘭多魔術隊正處於天賦爆發期。擁有多位身高臂長的長人，展現了未來籃球「無位置」的防守潛力。", color: .blue, logoImage: "24"),
    
    Team(name: "Nets", city: "Brooklyn", conference: "Eastern", championships: 0, description: "布魯克林籃網隊經歷過巨星雲集的輝煌與重建，現在他們轉向建立更加踏實的團隊球風，致力於成為紐約另一股強大的勢力。", color: .black, logoImage: "25"),
    
    Team(name: "Hawks", city: "Atlanta", conference: "Eastern", championships: 1, description: "老鷹隊以犀利的後衛組織與外線火力見長。亞特蘭大的進攻球風一向大膽且具實驗性，總是能讓比賽陷入瘋狂的對攻戰。", color: .red, logoImage: "26"),
    
    Team(name: "Raptors", city: "Toronto", conference: "Eastern", championships: 1, description: "作為 NBA 唯一一支加拿大球隊，暴龍隊代表著整個國家的熱情。他們在 2019 年奪冠，並以發掘與培養國際球員的能力著稱。", color: .red, logoImage: "27"),
    
    Team(name: "Wizards", city: "Washington", conference: "Eastern", championships: 1, description: "華盛頓巫師隊目前正致力於重新定義球隊方向。在經歷過多次世代更迭後，他們正努力在首都建立新的競爭基石。", color: .blue, logoImage: "28"),
    
    Team(name: "Hornets", city: "Charlotte", conference: "Eastern", championships: 0, description: "黃蜂隊以標誌性的湖水綠與帥氣的球風吸引年輕粉絲。雖然仍在追逐頂尖排名的路上，但其華麗的傳球風格令人印象深刻。", color: .cyan, logoImage: "29"),
    
    Team(name: "Pistons", city: "Detroit", conference: "Eastern", championships: 3, description: "底特律活塞隊象徵著「壞孩子」精神與藍領勞工文化。他們以強硬的防守與對抗性聞名，目前正處於蓄勢待發的重建階段。", color: .blue, logoImage: "30")
]

struct TeamListView: View {
    var body: some View {
        NavigationView {
            ZStack { // ZStack 放在裡面，背景才能穿透 List
                // 1. 最底層背景圖
                Image("teamwallpaper")
                    .resizable()
                    .scaledToFill() // 不要寫死 frame 的寬高，用 fill 讓它自動鋪滿
                    .ignoresSafeArea()
                    .offset(x: -50, y: 0)
                    .overlay(Color.black.opacity(0.8)) // 稍微加深遮罩
                    
                // 2. 列表層
                List(nbaTeams) { team in
                    NavigationLink(destination: TeamDetailView(team: team)) {
                        HStack(spacing: 15) {
                            Image(team.logoImage)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                                .foregroundColor(team.color)
                            
                            VStack(alignment: .leading) {
                                Text(team.name)
                                    .font(.headline)
                                    .foregroundColor(.white)
                                Text(team.city)
                                    .font(.subheadline)
                                    .foregroundColor(.white.opacity(0.9))
                            }
                        }
                        .padding(.vertical, 8)
                    }
                    // --- 關鍵修改：為每一行設定背景 ---
                    .listRowBackground(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.white.opacity(0.1)) // 設定半透明白色底
                            .padding(.vertical, 4)         // 讓卡片之間有一點間距
                            .padding(.horizontal, 8)
                    )
                    .listRowSeparator(.hidden) // 隱藏原本的清單分隔線，讓卡片感更強
                }
                .scrollContentBackground(.hidden)
                .listStyle(.plain)
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("NBA 球隊清單")
                        .font(.headline)
                        .foregroundColor(.white) // 手動指定標題顏色
                }
            }
        }
    }
}

struct TeamDetailView: View {
    let team: Team
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // 頂部大區塊
                ZStack(alignment: .bottomLeading) {
                    Rectangle()
                        .fill(team.color.gradient)
                        .frame(height: 200)
                    
                    VStack(alignment: .leading) {
                        Text(team.city)
                            .font(.title3)
                            .foregroundColor(.white.opacity(0.8))
                        Text(team.name)
                            .font(.system(size: 45, weight: .black))
                            .foregroundColor(.white)
                    }
                    .padding()
                }
                
                // 基本資訊卡片
                HStack {
                    InfoBox(title: "分區", value: team.conference)
                    InfoBox(title: "冠軍次數", value: "\(team.championships)")
                }
                .padding(.horizontal)
                
                // 詳細介紹
                VStack(alignment: .leading, spacing: 10) {
                    Text("球隊簡介")
                        .font(.title2)
                        .bold()
                    
                    Text(team.description)
                        .font(.body)
                        .foregroundColor(.secondary)
                        .lineSpacing(8)
                }
                .padding(.horizontal)
                
                Spacer()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

// 輔助組件：小資訊盒
struct InfoBox: View {
    var title: String
    var value: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(.caption)
                .foregroundColor(.secondary)
            Text(value)
                .font(.headline)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(10)
    }
}

#Preview {
    TeamListView()
}
