//
//  DataFetcher.swift
//  friendfaceProject
//
//  Created by Андрей Завадский on 28.02.2025.
//
import SwiftData
import Foundation

@MainActor
class DataFetcher {
    static func loadDataIfNeeded(modelContext: ModelContext) async {
        let fetchDescriptor = FetchDescriptor<User>()

        do {
            let users = try modelContext.fetch(fetchDescriptor)
            if !users.isEmpty { return } // Если данные уже есть, выходим

            print("Загружаем данные с сервера...")

            let urlString = "https://www.hackingwithswift.com/samples/friendface.json"
            guard let url = URL(string: urlString) else { return }

            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            let decodedUsers = try decoder.decode([CodableUser].self, from: data)

            // Конвертируем CodableUser → User и сохраняем в SwiftData
            for codableUser in decodedUsers {
                let user = User(
                    id: codableUser.id,
                    name: codableUser.name,
                    isActive: codableUser.isActive,
                    age: codableUser.age,
                    company: codableUser.company,
                    email: codableUser.email,
                    address: codableUser.address,
                    about: codableUser.about,
                    registered: codableUser.registered,
                    tags: codableUser.tags,
                    friends: codableUser.friends.map { Friend(id: $0.id, name: $0.name) }
                )
                modelContext.insert(user)
            }
            try modelContext.save()

            print("Данные загружены и сохранены!")

        } catch {
            print("Ошибка загрузки данных: \(error.localizedDescription)")
        }
    }
}
