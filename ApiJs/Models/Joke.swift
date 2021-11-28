//
//  Joke.swift
//  ApiJson
//
//  Created by Vadim Kontush on 26.11.21.
//

struct Joke: Decodable{
    let error: Bool
    let category, type, setup, delivery: String
    let flags: Flags
}

// MARK: - Flags
struct Flags: Decodable {
    let nsfw, religious, political, racist: Bool
    let sexist, explicit: Bool
}
