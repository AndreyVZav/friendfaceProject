//
//  friendfaceProjectApp.swift
//  friendfaceProject
//
//  Created by Андрей Завадский on 28.02.2025.
//
import SwiftData
import SwiftUI

@main
struct friendfaceProjectApp: App {
    var body: some Scene {
        WindowGroup {
            UserListView()
        }
        .modelContainer(for: User.self)
    }
}
