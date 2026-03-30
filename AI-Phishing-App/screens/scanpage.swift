import SwiftUI

enum ScanTab {
    case url
    case text
    case qr
    case image
}

struct ScanView: View {
    @State private var selectedTab: ScanTab

        init(initialTab: ScanTab = .url) {
            _selectedTab = State(initialValue: initialTab)
        }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Scan")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.horizontal)

                ScanHeaderView(selectedTab: $selectedTab)
                    .padding(.horizontal)
                    .font(.system(size: 21))

                Group {
                    switch selectedTab {
                    case .url:
                        ScanURLView()
                    case .text:
                        ScanTextView()
                    case .qr:
                        ScanQRView()
                    case .image:
                        ScanImageView()
                    }
                }
                .padding(.horizontal)

                Spacer()
            }
            .padding(.top)
        }
    }
}
