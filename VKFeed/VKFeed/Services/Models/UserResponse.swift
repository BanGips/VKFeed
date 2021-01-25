//
//  UserResponse.swift
//  VKFeed
//
//  Created by BanGips on 8.01.21.
//

import Foundation

struct UserResponseWrapped: Decodable {
    let response: [UserResponse]
}

struct UserResponse: Decodable {
    let photo100: String?
}
