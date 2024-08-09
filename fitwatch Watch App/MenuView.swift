//
//  MenuView.swift
//  fitwatch Watch App
//
//  Created by Shivam Patel on 8/8/24.
//
import SwiftUI

struct ListItemView: View {
    var title: String
    var subheading: String
    var iconName: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.system(size: 20, weight: .bold)) // Increase the font size for the title
                Text(subheading)
                    .font(.system(size: 14, weight: .regular)) // Decrease the font size for the subheading
                    .foregroundColor(.gray)
            }
            Spacer()
            Image(systemName: iconName)
                .foregroundColor(.blue) // Optional: Change the color of the icon
                .font(.system(size: 20)) // Optional: Adjust the size of the icon
        }
        .padding(.vertical, 5) // Optional: Add some vertical padding for better spacing
    }
}

struct MenuView: View {
    var body: some View {
        
        List {
            NavigationLink(destination: WorkoutView(workoutSetting: WorkoutSetting(title: "Slow", contractionDuration: 2, eccentricDuration: 4))) {
                ListItemView(title: "Slow", subheading: "2 sec contraction\n4 sec eccentric", iconName: "tortoise.fill")
            }
            NavigationLink(destination: WorkoutView(workoutSetting: WorkoutSetting(title: "Moderate", contractionDuration: 1, eccentricDuration: 3))) {
                ListItemView(title: "Moderate", subheading: "1 sec contraction\n3 sec eccentric", iconName: "hare.fill")
            }
            NavigationLink(destination: WorkoutView(workoutSetting: WorkoutSetting(title: "Fast", contractionDuration: 1, eccentricDuration: 2))) {
                ListItemView(title: "Faset", subheading: "1 sec contraction\n2 sec eccentric", iconName: "flame.fill")
            }
        }
    }
}


#Preview {
    MenuView()
}
