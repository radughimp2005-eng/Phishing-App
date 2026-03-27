//
//  content.swift
//  detect phishing app
//
//  Created by Ghimp Radu on 24/03/2026.
//

import SwiftUI

struct SafetyTip: Identifiable {
    let id = UUID()
    let title: String
    let message: String
}

struct SafetyTipsView: View {
    let tips: [SafetyTip] = [
        SafetyTip(
            title: "Tip 1",
            message: "Avoid clicking links from unknown senders - especially shortened URLs like bit.ly or tinyurl."
        ),
        SafetyTip(
            title: "Tip 2",
            message: "Check the sender's email address carefully. Attackers often use addresses that look almost real."
        ),
        SafetyTip(
            title: "Tip 3",
            message: "Do not scan random QR codes in public places unless you trust the source or are sure."
        ),
        SafetyTip(
            title: "Tip 4",
            message: "Don'trust urgent or threatening language - real companies don't pressure you to act fast."
        ),
        SafetyTip(
            title: "Tip 5",
            message: "Never give out personal information over email or text unless you are 100% sure who you are talking to."
        ),
        SafetyTip(
            title: "Tip 6",
            message: "Never send money to someone you have not met or talked online, even if the story sounds convincing."
        )
    ]
    
    @State private var currentIndex = 0
    @State private var moveForward = true
    
    var body: some View {
        VStack(alignment: .leading, spacing: 18) {
            
            HStack {
                Text("Safety Tips")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Spacer()
                
                HStack(spacing: 16) {
                    Button(action: showPreviousTip) {
                        Image(systemName: "chevron.left")
                            .font(.title3)
                            .foregroundColor(.black)
                    }
                    .buttonStyle(.plain)
                    
                    Button(action: showNextTip) {
                        Image(systemName: "chevron.right")
                            .font(.title3)
                            .foregroundColor(.black)
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(.horizontal, 30)
            
            ZStack {
                tipCard(for: tips[currentIndex])
                    .id(currentIndex)
                    .transition(
                        .asymmetric(
                            insertion: moveForward
                                ? .move(edge: .trailing)
                                : .move(edge: .leading),
                            removal: moveForward
                                ? .move(edge: .leading)
                                : .move(edge: .trailing)
                        )
                    )
            }
            .clipped()
            .animation(.easeInOut(duration: 0.3), value: currentIndex)
        }
        .padding(.bottom, 55)
    }
    
    @ViewBuilder
    private func tipCard(for tip: SafetyTip) -> some View {
        VStack(alignment: .leading, spacing: 14) {
            Text(tip.title)
                .font(.headline)
                .fontWeight(.bold)
            
            Text(tip.message)
                .font(.body)
                .foregroundColor(.black)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(20)
        .background(Color.white)
        .cornerRadius(0)
        .shadow(color: .black.opacity(0.08), radius: 6, x: 0, y: 3)
        .padding(.horizontal, 10)
        .padding(.bottom, 6)
    }
    
    private func showNextTip() {
        moveForward = true
        withAnimation {
            currentIndex = (currentIndex + 1) % tips.count
        }
    }
    
    private func showPreviousTip() {
        moveForward = false
        withAnimation {
            currentIndex = (currentIndex - 1 + tips.count) % tips.count
        }
    }
}

