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
            ListItemView(title: "Slow", subheading: "2 sec contraction\n5 sec eccentric", iconName: "tortoise.fill")
            ListItemView(title: "Moderate", subheading: "1 sec contraction\n3 sec eccentric", iconName: "hare.fill")
            ListItemView(title: "Fast", subheading: "1 sec contraction\n2 sec eccentric", iconName: "flame.fill")
        }
    }
}


#Preview {
    MenuView()
}
