//
//  scan header.swift
//  AI-Phishing-App
//
//  Created by Ghimp Radu on 28/03/2026.
//

import SwiftUI

struct ScanHeaderView: View {
    @Binding var selectedTab: ScanTab

    var body: some View {
        HStack(spacing: 0) {
            tabButton(title: "URL", tab: .url)
            tabButton(title: "Text", tab: .text)
            tabButton(title: "QR", tab: .qr)
            tabButton(title: "Image", tab: .image)
        }
        .frame(height: 44)
        .background(Color.blue)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }

    @ViewBuilder
    private func tabButton(title: String, tab: ScanTab) -> some View {
        Button(action: {
            selectedTab = tab
        }) {
            Text(title)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(selectedTab == tab ? Color.cyan : Color.clear)
        }
        .buttonStyle(.plain)
    }
}
