//
//  scan QR.swift
//  AI-Phishing-App
//
//  Created by Ghimp Radu on 28/03/2026.
//

import SwiftUI
import VisionKit
import Vision

struct QRScannerView: UIViewControllerRepresentable {
    var onCodeScanned: (String) -> Void

    func makeCoordinator() -> Coordinator {
        Coordinator(onCodeScanned: onCodeScanned)
    }

    func makeUIViewController(context: Context) -> DataScannerViewController {
        let recognizedTypes: Set<DataScannerViewController.RecognizedDataType> = [
            .barcode(symbologies: [.qr])
        ]

        let scanner = DataScannerViewController(
            recognizedDataTypes: recognizedTypes,
            qualityLevel: .balanced,
            recognizesMultipleItems: false,
            isHighFrameRateTrackingEnabled: true,
            isHighlightingEnabled: false
        )

        scanner.delegate = context.coordinator
        return scanner
    }

    func updateUIViewController(_ uiViewController: DataScannerViewController, context: Context) {
    }

    static func dismantleUIViewController(_ uiViewController: DataScannerViewController, coordinator: Coordinator) {
        uiViewController.stopScanning()
    }

    final class Coordinator: NSObject, DataScannerViewControllerDelegate {
        let onCodeScanned: (String) -> Void

        init(onCodeScanned: @escaping (String) -> Void) {
            self.onCodeScanned = onCodeScanned
        }

        func dataScanner(_ dataScanner: DataScannerViewController,
                         didAdd addedItems: [RecognizedItem],
                         allItems: [RecognizedItem]) {
            for item in addedItems {
                if case .barcode(let barcode) = item,
                   let payload = barcode.payloadStringValue {
                    onCodeScanned(payload)
                    break
                }
            }
        }
    }
}

struct ScanQRView: View {
    @State private var scannedCode: String = ""
    @State private var showScanner = false
    @State private var scannerAvailable = false

    var body: some View {
        VStack(spacing: 24) {
            if scannerAvailable {
                ZStack {
                    QRScannerView { code in
                        scannedCode = code
                        print("Scanned QR code: \(code)")
                    }
                    .ignoresSafeArea(edges: .bottom)

                    RoundedRectangle(cornerRadius: 24)
                        .stroke(Color.blue, lineWidth: 4)
                        .frame(width: 260, height: 260)

                    VStack {
                        Spacer()

                        Text("Point camera at QR code")
                            .padding(.horizontal, 20)
                            .padding(.vertical, 12)
                            .background(Color.gray.opacity(0.3))
                            .cornerRadius(20)
                            .padding(.bottom, 40)
                    }
                }
                .frame(height: 420)

                if !scannedCode.isEmpty {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Scanned result")
                            .font(.headline)

                        Text(scannedCode)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .textSelection(.enabled)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .background(Color.blue.opacity(0.1))
                    .cornerRadius(12)
                }
            } else {
                VStack(spacing: 20) {
                    RoundedRectangle(cornerRadius: 24)
                        .stroke(Color.blue, lineWidth: 4)
                        .frame(width: 260, height: 260)
                        .overlay(
                            Image(systemName: "camera.fill")
                                .font(.system(size: 48))
                                .foregroundColor(.blue)
                        )

                    Text("Camera scanner not available on this device")
                        .foregroundColor(.gray)

                    Text("Point camera at QR code")
                        .padding(.horizontal, 20)
                        .padding(.vertical, 12)
                        .background(Color.gray.opacity(0.3))
                        .cornerRadius(20)
                }
                .frame(maxWidth: .infinity)
                .padding(.top, 40)
            }
        }
        .onAppear {
            scannerAvailable = DataScannerViewController.isSupported && DataScannerViewController.isAvailable
        }
    }
}
