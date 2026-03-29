//
//  scan image.swift
//  AI-Phishing-App
//
//  Created by Ghimp Radu on 28/03/2026.
//

import SwiftUI
import PhotosUI

struct ScanImageView: View {
    
    @State private var selectedItem: PhotosPickerItem?
    @State private var selectedImage: Image?
    
    var body: some View {
        VStack(spacing: 24) {
            Image(systemName: "photo")
                .font(.system(size: 90))
                .foregroundColor(Color.cyan)

            Text("Scan an image")
                .font(.title3)

            Text("Upload a screenshot of a suspicious message or website")
                .multilineTextAlignment(.center)
                .foregroundColor(.gray)

            PhotosPicker(
                selection: $selectedItem,
                matching: .images,
                photoLibrary: .shared()
            ) {
                VStack(spacing: 16) {
                    if let selectedImage {
                            selectedImage
                            .resizable()
                            .scaledToFit()
                            .frame(height: 150)
                        
                        
                    } else {
                        Image(systemName: "plus.circle.fill")
                            .font(.system(size: 60))
                            .foregroundColor(.blue)

                        Text("Tap to Select Image")
                            .font(.title3)
                            .foregroundColor(Color.black)

                        Text("Choose from your photo library")
                            .foregroundColor(.gray)
                    }
                }
                .frame(maxWidth: .infinity)
                .frame(height: 180)
                .background(Color.blue.opacity(0.1))
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.blue, lineWidth: 4)
                )
                .cornerRadius(12)
            }
            .onChange(of: selectedItem) { _, newItem in
                Task {
                    guard let newItem else { return }

                    if let data = try? await newItem.loadTransferable(type: Data.self),
                        let uiImage = UIImage(data: data) {
                        selectedImage = Image(uiImage: uiImage)
                    }
                }
            }

            Button(action: {
                print("Scan Image tapped")
            }) {
                Label("Scan Image", systemImage: "magnifyingglass")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(12)
            }
            .buttonStyle(.plain)

            VStack(alignment: .leading, spacing: 16) {
                Text("What we analyze")
                    .font(.title2)
                    .fontWeight(.bold)

                Text("Embedded URLs")
                Text("Scam patterns")
                Text("Impersonation")
                Text("Financial Requests")
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .background(Color.blue.opacity(0.2))
            .cornerRadius(16)
        }
    }
}
