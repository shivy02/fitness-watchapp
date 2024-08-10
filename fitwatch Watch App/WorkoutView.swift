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
    @State private var isPlaying = false
    @State private var countdown = 3
    @State private var showCountdown = false
    @State private var timer: Timer?

    var workoutSetting: WorkoutSetting

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
                
                if showCountdown {
                    Text(countdown > 0 ? "\(countdown)" : "Go!")
                        .font(.headline)
                        .foregroundColor(.white)
                        .transition(.scale)
                        .scaleEffect(showCountdown ? 1.5 : 1.0)
                        .animation(.easeInOut(duration: 0.1), value: countdown)
                }
            }
            .scaleEffect(scale)
            .rotationEffect(.degrees(rotation))

            Spacer()

            Button(action: {
                isPlaying.toggle()
                if isPlaying {
                    showCountdown = true
                    countdown = 3
                    startCountdown()
                } else {
                    stopAnimations()
                }
            }) {
                Image(systemName: isPlaying ? "pause.fill" : "play.fill")
                    .foregroundColor(.blue)
                    .padding()
                    .background(Circle().fill(Color.black))
            }
            .buttonStyle(PlainButtonStyle())
        }
        .onDisappear() {
            self.stopAnimations()
        }
    }
    
    func startCountdown() {
        timer?.invalidate() // Invalidate any existing timer
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            if countdown > 0 {
                countdown -= 1
            } else {
                timer.invalidate()
                showCountdown = false
                startAnimations()
            }
        }
    }
    
    //function to start the animation
    func startAnimations() {
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
        
        DispatchQueue.global(qos: .userInitiated).async {
                    self.playHaptic()
                }
    }
    
    func stopAnimations() {
        timer?.invalidate() // Stop the countdown timer
        withAnimation {
            scale = 1.0
            rotation = 0.0
        }
        isPlaying = false
    }
    
    func playHaptic() {
            isPlaying = true // Ensure this is set to true to start the loop
            let eccentricInterval = TimeInterval(workoutSetting.eccentricDuration)
            let contractionInterval = TimeInterval(workoutSetting.contractionDuration)
            
            while isPlaying {
                let eccentricEndTime = Date().addingTimeInterval(eccentricInterval)
                while Date() < eccentricEndTime && isPlaying {
                    WKInterfaceDevice.current().play(.success)
                    Thread.sleep(forTimeInterval: 0.1) // Short delay to simulate continuous feedback
                }
                
                // Pause for 1 second if still playing
                if isPlaying { Thread.sleep(forTimeInterval: 1) }
                
                // Play constant haptic for contraction duration if still playing
                let contractionEndTime = Date().addingTimeInterval(contractionInterval)
                while Date() < contractionEndTime && isPlaying {
                    WKInterfaceDevice.current().play(.success)
                    Thread.sleep(forTimeInterval: 0.1) // Short delay to simulate continuous feedback
                }
            }
        }
}

struct WorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutView(workoutSetting: WorkoutSetting(title: "Example", contractionDuration: 2, eccentricDuration: 3))
    }
}
