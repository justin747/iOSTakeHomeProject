//
//  UsersResponse.swift
//  iOSTakeHomeProject
//
//  Created by Justin on 8/19/22.
//

import Foundation

struct UsersResponse: Codable {
    let page, perPage, total, totalPages: Int
    let data: [User]
    let support: Support


}
