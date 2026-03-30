import SwiftUI

enum ScanTab {
    case url
    case text
    case qr
    case image
}

struct ScanView: View {
    @Binding var selectedTab: ScanTab

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Scan")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.horizontal)

                ScanHeaderView(selectedTab: $selectedTab)
                    .padding(.horizontal)

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
            }
            .padding(.top)
        }
    }
}
