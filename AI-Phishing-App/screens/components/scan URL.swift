//
//  Scan URL.swift
//  AI-Phishing-App
//
//  Created by Ghimp Radu on 28/03/2026.
//

import SwiftUI

struct ScanURLView: View {
    @State private var urlText = ""

    var body: some View {
        VStack(spacing: 24) {
            Image(systemName: "link")
                .font(.system(size: 60))
                .foregroundColor(.cyan)

            Text("Enter an URL to scan")
                .font(.title3)

            Text("An AI integrated system will check it for phishing, scams and malware")
                .multilineTextAlignment(.center)
                .foregroundColor(.gray)

            TextField("https://example.com", text: $urlText)
                .padding()
                .background(Color.blue.opacity(0.1))
                .cornerRadius(12)

            Button(action: {
                print("Scan URL tapped")
                print( $urlText)
            }) {
                Label("Scan URL", systemImage: "magnifyingglass")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(12)
            }
            .buttonStyle(.plain)

            VStack(alignment: .leading, spacing: 16) {
                Text("Tips")
                    .font(.title2)
                    .fontWeight(.bold)

                Text("Copy a suspicious link and paste it here")
                Text("Received a sketchy text? Scan the link to check")
                Text("Don’t click email links - scan first")
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .background(Color.blue.opacity(0.2))
            .cornerRadius(16)
        }
    }
}
