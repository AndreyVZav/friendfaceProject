//
//  UserDetailView.swift
//  friendfaceProject
//
//  Created by Андрей Завадский on 28.02.2025.
//

import SwiftUI

struct UserDetailView: View {
    let user: User
    // Форматтер для красивого отображения даты
        private var formattedDate: String {
            let formatter = DateFormatter()
            formatter.dateStyle = .medium
            formatter.timeStyle = .short
            return formatter.string(from: user.registered)
        }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text(user.name)
                    .font(.largeTitle)
                    .bold()
                
                Text("Age: \(user.age)")
                Text("Company: \(user.company)")
                Text("Email: \(user.email)")
                Text("Address: \(user.address)")
                
                Divider()
                
                Text("Registered: \(formattedDate)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                Divider()
                
                Text("About")
                    .font(.headline)
                Text(user.about)
                    .font(.body)
                
                Divider()
                
                Text("Tags")
                    .font(.headline)
                
                HStack {
                    ForEach(user.tags, id: \.self) { tag in
                        Text("#\(tag)")
                            .padding(6)
                            .background(Color.blue.opacity(0.2))
                            .cornerRadius(8)
                    }
                }
                
                Divider()
                
                Text("Friends")
                    .font(.headline)
                
                ForEach(user.friends) { friend in
                    NavigationLink(destination: Text("Friend detail: \(friend.name)")) {
                        Text(friend.name)
                    }
                    .padding(.vertical, 2)
                }
            }
            .padding()
        }
        .navigationTitle(user.name)
    }
}


#Preview {
    UserDetailView(user: mockUser)
}
