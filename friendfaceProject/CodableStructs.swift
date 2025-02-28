//
//  CodableStructs.swift
//  friendfaceProject
//
//  Created by Андрей Завадский on 28.02.2025.
//
import SwiftData
import Foundation

struct CodableFriend: Codable {
    let id: String
    let name: String
}

struct CodableUser: Codable {
    let id: String
    let name: String
    let isActive: Bool
    let age: Int
    let company: String
    let email: String
    let address: String
    let about: String
    let registered: Date
    let tags: [String]
    let friends: [CodableFriend]
}
