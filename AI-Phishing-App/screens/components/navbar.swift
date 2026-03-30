//
//  navbar.swift
//  detect phishing app
//
//  Created by Ghimp Radu on 25/03/2026.
//

import SwiftUI

struct NavBarView: View {
    @Binding var selectedTab: AppTab
    
    var body: some View {
        HStack (spacing: 35) {
            Button(action: {
                selectedTab = .home
                print("Home button clicked from navbar")
            }) {
                VStack {
                    Image(systemName: "house.fill")
                        .font(.system(size: 28))
                        .foregroundColor(selectedTab == .home ? .cyan : .black)

                    Text("Home")
                        .foregroundColor(selectedTab == .home ? .cyan : .black)
                }
            }
            .buttonStyle(.plain)

            Button(action: {
                selectedTab = .scan
                print("Scan icon clicked from navbar")
            }) {
                VStack {
                    Image(systemName: "qrcode.viewfinder")
                        .font(.system(size: 28))
                        .foregroundColor(selectedTab == .scan ? .cyan : .black)

                    Text("Scan")
                        .foregroundColor(selectedTab == .scan ? .cyan : .black)
                }
            }
            .buttonStyle(.plain)
            
            VStack (spacing: 3) {
                Image(systemName: "clock.arrow.trianglehead.counterclockwise.rotate.90")
                    .font(.system(size: 30))
                Text("History")
            }
            
            VStack (spacing: -1) {
                Image("settings")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.cyan)
                Text("Settings")
            }
        }
    }
}
