//
//  ImagesAPI.swift
//  AppMovies
//
//  Created by Aron Uchoa Bruno on 01/11/23.
//

import Foundation

struct ImagesAPI {
    let imageBaseURL = "https://image.tmdb.org/t/p/"
}

enum PosterSizes: String {
    case w92
    case w154
    case w185
    case w342
    case w500
    case w780
    case original
}
