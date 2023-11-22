//
//  Movie.swift
//  AppMovies
//
//  Created by Aron Uchoa Bruno on 01/11/23.
//

import Foundation

struct Movie: Codable, Identifiable, Equatable {
    let id: Int
    let posterPath: String
    let title: String
    let overview: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case posterPath = "poster_path"
        case title
        case overview
    }
}
