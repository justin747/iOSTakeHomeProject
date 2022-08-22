//
//  Models.swift
//  iOSTakeHomeProject
//
//  Created by Justin on 8/21/22.
//
//This file holds models for features that are shared


import Foundation

// MARK: - User
struct User: Codable {
    let id: Int
    let email, firstName, lastName: String
    let avatar: String
}

// MARK: - Support
struct Support: Codable {
    let url: String
    let text: String
}
