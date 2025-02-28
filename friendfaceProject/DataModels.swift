//
//  DataModels.swift
//  friendfaceProject
//
//  Created by Андрей Завадский on 28.02.2025.
//

import Foundation

struct Friend: Codable, Identifiable {
    let id: String
    let name: String
}

struct User: Codable, Identifiable {
    let id: String
    let name: String
    let isActive: Bool
    let age: Int
    let company: String
    let email: String
    let address: String
    let about: String
    let registered: Date  // Дата регистрации в виде строки
    let tags: [String]       // Список тегов
    let friends: [Friend]


private enum CodingKeys: String, CodingKey {
       case id, name, isActive, age, company, email, address, about, registered, tags, friends
   }
}

// Настроим кастомный JSONDecoder для использования .iso8601
extension JSONDecoder {
   static let iso8601Decoder: JSONDecoder = {
       let decoder = JSONDecoder()
       decoder.dateDecodingStrategy = .iso8601
       return decoder
   }()
}

let isoFormatter = ISO8601DateFormatter()
let registeredDate = isoFormatter.date(from: "2015-11-10T01:47:18-00:00") ?? Date() // Если ошибка, используем текущую дату


let mockUser = User(
        id: "50a48fa3-2c0f-4397-ac50-64da464f9954",
        name: "Alford Rodriguez",
        isActive: false,
        age: 21,
        company: "Imkan",
        email: "alfordrodriguez@imkan.com",
        address: "907 Nelson Street, Cotopaxi, South Dakota, 5913",
        about: "Occaecat consequat elit aliquip magna laboris dolore laboris sunt officia adipisicing reprehenderit sunt. Do in proident consectetur labore. Laboris pariatur quis incididunt nostrud labore ad cillum veniam ipsum ullamco. Dolore laborum commodo veniam nisi. Eu ullamco cillum ex nostrud fugiat eu consequat enim cupidatat. Non incididunt fugiat cupidatat reprehenderit nostrud eiusmod eu sit minim do amet qui cupidatat. Elit aliquip nisi ea veniam proident dolore exercitation irure est deserunt.",
        registered: registeredDate,
        tags: ["cillum", "consequat", "deserunt", "nostrud", "eiusmod", "minim", "tempor"],
        friends: [
            Friend(id: "91b5be3d-9a19-4ac2-b2ce-89cc41884ed0", name: "Hawkins Patel"),
            Friend(id: "0c395a95-57e2-4d53-b4f6-9b9e46a32cf6", name: "Jewel Sexton"),
            Friend(id: "be5918a3-8dc2-4f77-947c-7d02f69a58fe", name: "Berger Robertson")
        ]
    )
