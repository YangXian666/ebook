import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomePageView()
                .tabItem {
                    Image(systemName: "basketball")
                    Text("Home")
                }
            TeamListView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Team")
                }
            StatsView()
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("Stats")
                }
            BracketView()
                .tabItem {
                    Image(systemName: "figure.mixed.cardio")
                    Text("Playoff")
                }
        }
    }
}

#Preview {
    ContentView()
}
