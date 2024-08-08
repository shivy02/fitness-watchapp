//
//  WorkoutView.swift
//  fitwatch Watch App
//
//  Created by Shivam Patel on 8/8/24.
//

import SwiftUI

struct WorkoutView: View {
    @State private var scale: CGFloat = 1.0
    @State private var rotation: Double = 0.0

    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.blue, lineWidth: 4)
                .frame(width: 100, height: 100) // Adjust size as needed
            
            Image(systemName: "circle.dotted")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60, height: 60) // Adjust size as needed
                .foregroundColor(.white)
        }
        .scaleEffect(scale)
        .rotationEffect(.degrees(rotation))
        .onAppear {
            withAnimation(
                Animation.easeInOut(duration: 1.0)
                    .repeatForever(autoreverses: true)
            ) {
                scale = 1.2
            }
            withAnimation(
                Animation.linear(duration: 2.0)
                    .repeatForever(autoreverses: false)
            ) {
                rotation = 360
            }
        }
    }
}

#Preview {
    WorkoutView()
}
