//
//  UserListView.swift
//  friendfaceProject
//
//  Created by Андрей Завадский on 28.02.2025.
//

import SwiftUI

struct UserListView: View {
    @StateObject private var dataFetcher = DataFetcher()

    var body: some View {
        NavigationStack {
            List(dataFetcher.users) { user in
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
            .onAppear {
                dataFetcher.loadData()
            }
        }
    }
}

#Preview {
    UserListView()
}
