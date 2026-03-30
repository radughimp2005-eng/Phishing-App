import SwiftUI

enum AppTab {
    case home
    case scan
}

struct ContentView: View {
    @State private var selectedTab: AppTab = .home
    @State private var selectedScanTab: ScanTab = .url

    var body: some View {
        VStack(spacing: 0) {
            Group {
                switch selectedTab {
                case .home:
                    HomePage(selectedTab: $selectedTab, selectedScanTab: $selectedScanTab)
                case .scan:
                    ScanView(selectedTab: $selectedScanTab)
                }
            }

            NavBarView(selectedTab: $selectedTab)
        }
    }
}

#Preview {
    ContentView()
}
