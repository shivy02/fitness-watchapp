//
//  HapticManager.swift
//  fitwatch Watch App
//
//  Created by Dev Patel on 8/8/24.
//

import Foundation
import WatchKit

struct HapticManager {
    
    // Function to play haptic feedback for slow mode
    static func startSlowHaptic() {
        // Play constant haptic for 5 seconds
        let endTime = Date().addingTimeInterval(5)
        while Date() < endTime {
            WKInterfaceDevice.current().play(.success)
            Thread.sleep(forTimeInterval: 0.1) // Short delay to simulate continuous feedback
        }
        
        // Pause for 1 second
        Thread.sleep(forTimeInterval: 1)
        
        // Play constant haptic for 2 seconds
        let secondEndTime = Date().addingTimeInterval(2)
        while Date() < secondEndTime {
            WKInterfaceDevice.current().play(.success)
            Thread.sleep(forTimeInterval: 0.1) // Short delay to simulate continuous feedback
        }
    }
    
    // Function to play haptic feedback for moderate mode
    static func startModerateHaptic() {
        // Play constant haptic for 3 seconds
        let endTime = Date().addingTimeInterval(3)
        while Date() < endTime {
            WKInterfaceDevice.current().play(.success)
            Thread.sleep(forTimeInterval: 0.1) // Short delay to simulate continuous feedback
        }
        
        // Pause for 1 second
        Thread.sleep(forTimeInterval: 1)
        
        // Play constant haptic for 2 seconds
        let secondEndTime = Date().addingTimeInterval(2)
        while Date() < secondEndTime {
            WKInterfaceDevice.current().play(.success)
            Thread.sleep(forTimeInterval: 0.1) // Short delay to simulate continuous feedback
        }
    }
    
    // Function to play haptic feedback for fast mode
    static func startFastHaptic() {
        let endTime = Date().addingTimeInterval(2) // Play for 3 seconds
        while Date() < endTime {
            WKInterfaceDevice.current().play(.success)
            Thread.sleep(forTimeInterval: 0.1)
        }
        
        Thread.sleep(forTimeInterval: 1) // Pause for 1 second
        
        let secondEndTime = Date().addingTimeInterval(1) // Play again for 2 seconds
        while Date() < secondEndTime {
            WKInterfaceDevice.current().play(.success)
            Thread.sleep(forTimeInterval: 0.1)
        }
    }
    // Generalized function to play haptic feedback
        static func playHaptic(eccentricDuration: TimeInterval, contractionDuration: TimeInterval) {
            // Play constant haptic for eccentric duration
            let eccentricEndTime = Date().addingTimeInterval(eccentricDuration)
            while Date() < eccentricEndTime {
                WKInterfaceDevice.current().play(.success)
                Thread.sleep(forTimeInterval: 0.1) // Short delay to simulate continuous feedback
            }
            
            // Pause for 1 second
            Thread.sleep(forTimeInterval: 1)
            
            // Play constant haptic for contraction duration
            let contractionEndTime = Date().addingTimeInterval(contractionDuration)
            while Date() < contractionEndTime {
                WKInterfaceDevice.current().play(.success)
                Thread.sleep(forTimeInterval: 0.1) // Short delay to simulate continuous feedback
            }
        }
    
}
