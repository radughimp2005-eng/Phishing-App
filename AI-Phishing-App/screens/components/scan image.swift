import SwiftUI
import PhotosUI

struct ScanImageView: View {
    
    @State private var selectedItem: PhotosPickerItem?
    @State private var selectedImage: Image?
    
    var body: some View {
        VStack(spacing: 24) {
            Image(systemName: "photo")
                .font(.system(size: 90))
                .foregroundColor(.cyan)

            Text("Scan an image")
                .font(.title3)

            Text("Upload a screenshot of a suspicious message or website")
                .multilineTextAlignment(.center)
                .foregroundColor(.gray)

            VStack(spacing: 16) {
                if let previewImage = selectedImage {
                    previewImage
                        .resizable()
                        .scaledToFit()
                        .frame(height: 150)

                    HStack(spacing: 12) {
                        PhotosPicker(
                            selection: $selectedItem,
                            matching: .images,
                            photoLibrary: .shared()
                        ) {
                            Text("Change Image")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.blue)
                                .cornerRadius(10)
                        }

                        Button(action: {
                            selectedImage = nil
                            selectedItem = nil
                        }) {
                            Text("Remove Image")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.red)
                                .cornerRadius(10)
                        }
                    }
                } else {
                    PhotosPicker(
                        selection: $selectedItem,
                        matching: .images,
                        photoLibrary: .shared()
                    ) {
                        VStack(spacing: 16) {
                            Image(systemName: "plus.circle.fill")
                                .font(.system(size: 60))
                                .foregroundColor(.blue)

                            Text("Tap to Select Image")
                                .font(.title3)
                                .foregroundColor(.black)

                            Text("Choose from your photo library")
                                .foregroundColor(.gray)
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 180)
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.blue.opacity(0.1))
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.blue, lineWidth: 4)
            )
            .cornerRadius(12)
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
                    .fontWeight(.bold)
                    .font(.system(size: 20))
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(12)
            }
            .buttonStyle(.plain)

            VStack(alignment: .leading, spacing: 21) {
                Text("What we analyze")
                    .font(.system(size: 23))
                    .fontWeight(.medium)

                HStack () {
                    Image(systemName: "link")
                        .font(.system(size: 25))
                        .fontWeight(.medium)
                    VStack () {
                        Text("Embedded URLs")
                            .font(.system(size: 20))
                            .fontWeight(.medium)
                            .frame(maxWidth: .infinity, alignment: .leading)

                        Text("Links hidden in the message")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .fontWeight(.light)
                    }
                }
                
                HStack () {
                    Image(systemName: "exclamationmark.triangle")
                        .font(.system(size: 25))
                        .fontWeight(.medium)
                    VStack () {
                        Text("Scam patterns")
                            .font(.system(size: 20))
                            .fontWeight(.medium)
                            .frame(maxWidth: .infinity, alignment: .leading)

                        Text("Urgency, threats, prize claims")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .fontWeight(.light)
                    }
                }
                
                HStack () {
                    Image(systemName: "building.2")
                        .font(.system(size: 25))
                        .fontWeight(.medium)
                    VStack () {
                        Text("Impersonation")
                            .font(.system(size: 20))
                            .fontWeight(.medium)
                            .frame(maxWidth: .infinity, alignment: .leading)

                        Text("Fake bank or company messages")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .fontWeight(.light)
                    }
                }
                
                HStack () {
                    Image(systemName: "dollarsign.ring")
                        .font(.system(size: 25))
                        .fontWeight(.medium)
                    VStack () {
                        Text("Financial Requests")
                            .font(.system(size: 20))
                            .fontWeight(.medium)
                            .frame(maxWidth: .infinity, alignment: .leading)

                        Text("Requests for payment or gift cards")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .fontWeight(.light)
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .background(Color.blue.opacity(0.2))
            .cornerRadius(16)
        }
    }
}
