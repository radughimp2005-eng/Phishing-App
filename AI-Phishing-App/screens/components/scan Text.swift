//
//  scan Text.swift
//  AI-Phishing-App
//
//  Created by Ghimp Radu on 28/03/2026.
//

import SwiftUI

struct ScanTextView: View {
    @State private var suspiciousText = ""

    var body: some View {
        VStack(spacing: 24) {
            Image(systemName: "message")
                .font(.system(size: 60))
                .foregroundColor(.cyan)

            Text("Paste Suspicious Text")
                .font(.title3)

            Text("Paste a suspicious message to scan for scams")
                .multilineTextAlignment(.center)
                .foregroundColor(.gray)

            ZStack(alignment: .topLeading) {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.blue.opacity(0.1))
                    .frame(height: 220)

                TextEditor(text: $suspiciousText)
                    .padding(8)
                    .scrollContentBackground(.hidden)
                    .background(Color.clear)
                    .frame(height: 220)

                if suspiciousText.isEmpty {
                    Text("Paste your suspicious text message here...")
                        .foregroundColor(.gray)
                        .padding(.top, 16)
                        .padding(.leading, 14)
                }
            }

            Button(action: {
                print("Scan Text tapped")
            }) {
                Label("Scan Text", systemImage: "magnifyingglass")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(12)
            }
            .buttonStyle(.plain)
        }
    }
}
