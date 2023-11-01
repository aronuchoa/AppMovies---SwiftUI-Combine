//
//  MoviesAPI.swift
//  AppMovies
//
//  Created by Aron Uchoa Bruno on 01/11/23.
//

import Foundation
import Combine

protocol MoviesFetchable {
    func fetchMoviesList() -> AnyPublisher<UpcomingResult, APIError>
}

class MoviesAPI {
    private let session: URLSession
    init(session: URLSession = .shared) {
        self.session = session
    }
}

private extension MoviesAPI {
    struct MoviesAPIComponent {
        static let scheme = "https"
        static let host = "api.themoviedb.org"
        static let path = "/3/movie/upcoming"
    }
    
    func urlComponentForMoviesList() -> URLComponents {
        var components = URLComponents()
        components.scheme = MoviesAPIComponent.scheme
        components.host = MoviesAPIComponent.host
        components.path = MoviesAPIComponent.path
        components.queryItems = [
          URLQueryItem(name: "language", value: "en-US"),
          URLQueryItem(name: "page", value: "1")
        ]
        return components
    }
}

extension MoviesAPI: MoviesFetchable, Fetchable {
    func fetchMoviesList() -> AnyPublisher<UpcomingResult, APIError> {
        return fetch(with: self.urlComponentForMoviesList(), session: self.session)
    }
}
