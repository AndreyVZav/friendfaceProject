//
//  DataFetcher.swift
//  friendfaceProject
//
//  Created by Андрей Завадский on 28.02.2025.
//

import Foundation

class DataFetcher: ObservableObject {
    @Published var users: [User] = []

    func loadData() {
        guard users.isEmpty else { return } // Проверяем, загружены ли уже данные

        let urlString = "https://www.hackingwithswift.com/samples/friendface.json"
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Ошибка загрузки данных: \(error?.localizedDescription ?? "Неизвестная ошибка")")
                return
            }

            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let decodedUsers = try decoder.decode([User].self, from: data)
                
                DispatchQueue.main.async {
                    self.users = decodedUsers
                }
            } catch {
                print("Ошибка декодирования JSON: \(error)")
            }
        }.resume()
    }
}
