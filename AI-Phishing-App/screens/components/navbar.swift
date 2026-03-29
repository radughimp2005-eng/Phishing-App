//
//  navbar.swift
//  detect phishing app
//
//  Created by Ghimp Radu on 25/03/2026.
//

import SwiftUI

struct NavBarView: View {
    var body: some View {
        HStack (spacing: 40) {
            NavigationLink(
                destination: HomePage(),
                label: {
                    VStack (spacing: 4) {
                        Image(systemName: "house.fill")
                            .font(.system(size: 30))
                            .foregroundColor(.cyan)
                        Text("Home")
                            .foregroundColor(.cyan)
                    }
                }
            )
            
            NavigationLink(
                destination: ScanView(),
                label: {
                    VStack (spacing: 7) {
                        Image(systemName: "qrcode.viewfinder")
                            .font(.system(size: 30))
                            .foregroundColor(.black)
                        Text("Scan")
                            .foregroundColor(.black)
                    }
                }
            )
            
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
