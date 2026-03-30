//
//  homepage.swift
//  detect phishing app
//
//  Created by Ghimp Radu on 24/03/2026.
//

import SwiftUI

struct HomePage: View {
    
    var body: some View {
        VStack () {
            HStack(spacing: 8) {
                Image("logo")
                    .resizable()
                    .frame(width: 75, height: 75)
                
                Text("TrustGuard")
                    .font(.headline)
                    .fontWeight(.bold)
                
                Spacer()
                
                Image("settings")
                    .resizable()
                    .frame(width: 50, height: 50)
            }
            .padding(20)
            
            VStack (spacing: 25) {
                Text("Quick Scan")
                    .font(.title2)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading) // aligns text to leading
                    .padding(.leading, 20) // only left padding
                HStack (spacing:20) {
                        NavigationLink(
                            destination: ScanView(),
                            label: {
                                VStack (spacing: 15) {
                                    RoundedRectangle (cornerRadius: 10)
                                        .fill(Color.lightBlue)
                                        .frame(width: 70, height: 53)
                                        .overlay(
                                            Image(systemName: "link")
                                                .resizable()
                                                .frame(width: 44, height: 44)
                                                .padding(12)
                                        )
                                    
                                    Text("Scan URL")
                                        .fontWeight(.semibold)
                                        .font(.system(size: 12))
                                        .foregroundColor(.white)
                                }
                                .padding(18)
                                .background(Color.darkBlue)
                                .cornerRadius(10)
                                .frame(width: 106, height: 106)
                            }
                        )
                    NavigationLink(
                        destination: ScanView(),
                        label: {
                            VStack (spacing: 15) {
                                RoundedRectangle (cornerRadius: 10)
                                    .fill(Color.lightBlue)
                                    .frame(width: 70, height: 53)
                                    .overlay(
                                        Image("scan QR")
                                            .resizable()
                                            .frame(width: 44, height: 44)
                                            .padding(12)
                                    )
                                
                                Text("Scan QR")
                                    .fontWeight(.semibold)
                                    .font(.system(size: 12))
                                    .foregroundColor(.white)
                            }
                            .padding(18)
                            .background(Color.darkBlue)
                            .cornerRadius(10)
                            .frame(width: 106, height: 106)
                        }
                    )
                    
                    NavigationLink(
                        destination: ScanView(),
                        label: {
                            VStack (spacing: 15) {
                                RoundedRectangle (cornerRadius: 10)
                                    .fill(Color.lightBlue)
                                    .frame(width: 70, height: 53)
                                    .overlay(
                                        Image("scan image")
                                            .resizable()
                                            .frame(width: 44, height: 44)
                                            .padding(12)
                                    )
                                
                                Text("Scan image")
                                    .fontWeight(.semibold)
                                    .font(.system(size: 12))
                                    .foregroundColor(.white)
                            }
                            .padding(18)
                            .background(Color.darkBlue)
                            .cornerRadius(10)
                            .frame(width: 110, height: 106)
                        }
                    )
                }
            }
        }
        VStack {
            HStack {
                Text("Recent Scans")
                    .fontWeight(.semibold)
                    .font(.system(size: 20))
                Spacer()
                Text("View All")
                    .fontWeight(.semibold)
                    .font(.system(size: 12))
            }
            .padding(.horizontal, 30)
            .padding(.top, 30)
            
            VStack {
                HStack {
                    RoundedRectangle (cornerRadius: 10)
                        .fill(Color.cyan.opacity(0.3))
                        .frame(width: 37, height: 34)
                        .overlay(
                            Image("scan QR")
                                .resizable()
                                .frame(width: 25, height: 23)
                                .padding(12)
                        )
                    Text("app_session_id=a54e54...")
                        .fontWeight(.semibold)
                        .font(.system(size: 12))
                        .padding(.leading, 5)
                    Spacer()
                    Text("25%")
                        .foregroundColor(Color.red)
                        .fontWeight(.bold)
                }
                .padding(10)
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 2, x:0, y:6)
                .padding(.horizontal, 20)
                .padding(.top, -8)
    
                HStack {
                    RoundedRectangle (cornerRadius: 10)
                        .fill(Color.cyan.opacity(0.4))
                        .frame(width: 37, height: 34)
                        .overlay(
                            Image("scan image")
                                .resizable()
                                .frame(width: 25, height: 23)
                                .padding(12)
                        )
                    Text("Image scan")
                        .fontWeight(.semibold)
                        .font(.system(size: 12))
                        .padding(.leading, 5)
                    Spacer()
                    Text("95%")
                        .foregroundColor(Color.green)
                        .fontWeight(.bold)
                }
                .padding(10)
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 2, x:0, y:6)
                .padding(.horizontal, 20)
                .padding(.top, 10)
            }
            .padding(20)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(maxHeight: .infinity, alignment: .top)
        SafetyTipsView()
    }
}
    
