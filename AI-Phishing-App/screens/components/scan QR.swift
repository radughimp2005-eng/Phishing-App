//
//  scan QR.swift
//  AI-Phishing-App
//
//  Created by Ghimp Radu on 28/03/2026.
//

import SwiftUI

struct ScanQRView: View {
    var body: some View {
        VStack(spacing: 40) {
            RoundedRectangle(cornerRadius: 24)
                .stroke(Color.blue, lineWidth: 4)
                .frame(width: 260, height: 260)

            Text("Point camera at QR code")
                .padding(.horizontal, 20)
                .padding(.vertical, 12)
                .background(Color.gray.opacity(0.3))
                .cornerRadius(20)

            Spacer()
        }
        .frame(maxWidth: .infinity)
        .padding(.top, 40)
    }
}
