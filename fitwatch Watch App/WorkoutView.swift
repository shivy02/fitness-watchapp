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
    @State private var isPlaying = false // Track play/pause state
    var workoutSetting: WorkoutSetting
    @State private var isAnimating = false
    @State private var showCountdown = true

    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .stroke(Color.blue, lineWidth: 4)
                    .frame(width: 100, height: 100)
                
                Image(systemName: "circle.dotted")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 60, height: 60)
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

            Spacer() // Add a spacer to push the button down

            // Play/Pause Button
            Button(action: {
                isPlaying.toggle() // Toggle play/pause state
            }) {
                Image(systemName: isPlaying ? "pause.fill" : "play.fill")
                    .foregroundColor(.blue)
                    .padding()
                    .background(Circle().fill(Color.black)) // Adjusted circle background
            }
            .buttonStyle(PlainButtonStyle()) // Remove any default styling that might add outlines
        }
    }
    
    
//    func toggleAnimation() {
//        
//        if isAnimating {
//            isAnimating = false
//        } else {
//            //countdown
//        }
//    }
//        
//    func startCOuntDown() {
//        let countdown = 3
//        showCountdown = true
//        
//    }
}

struct WorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutView(workoutSetting: WorkoutSetting(title: "Example", contractionDuration: 2, eccentricDuration: 3))
    }
}
