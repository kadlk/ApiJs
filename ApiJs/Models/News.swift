//
//  News.swift
//  ApiJs
//
//  Created by Vadim Kontush on 27.11.21.
//

import Foundation

// MARK: - Welcome6
struct Welcome:Decodable {
    var status: String
    var news: [News]
}

// MARK: - News
struct News:Decodable {
    let id, title, description: String?
    let author: String?
    let image: String?
}
