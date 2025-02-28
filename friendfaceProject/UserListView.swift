//
//  UserListView.swift
//  friendfaceProject
//
//  Created by Андрей Завадский on 28.02.2025.
//
import SwiftData
import SwiftUI

struct UserListView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var users: [User]

    var body: some View {
        NavigationStack {
            List(users) { user in
                NavigationLink(destination: UserDetailView(user: user)) {
                    HStack {
                        Circle()
                            .fill(user.isActive ? .green : .red)
                            .frame(width: 12, height: 12)
                        
                        VStack(alignment: .leading) {
                            Text(user.name)
                                .font(.headline)
                            Text(user.isActive ? "Online" : "Offline")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
            .navigationTitle("Users")
            .task {
                await DataFetcher.loadDataIfNeeded(modelContext: modelContext)
            }
        }
    }
}

#Preview {
    UserListView()
        .modelContainer(for: User.self, inMemory: true)
}
