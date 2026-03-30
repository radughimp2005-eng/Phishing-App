import SwiftUI

enum AppTab {
    case home
    case scan
}

struct ContentView: View {
    @State private var selectedTab: AppTab = .home

    var body: some View {
        VStack(spacing: 0) {
            Group {
                switch selectedTab {
                case .home:
                    NavigationStack {
                        HomePage()
                    }
                case .scan:
                    ScanView()
                }
            }

            NavBarView(selectedTab: $selectedTab)
        }
    }
}

#Preview {
    ContentView()
}
