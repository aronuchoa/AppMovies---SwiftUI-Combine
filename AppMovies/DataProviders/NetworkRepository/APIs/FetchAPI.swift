//
//  FetchAPI.swift
//  AppMovies
//
//  Created by Aron Uchoa Bruno on 01/11/23.
//

import Foundation
import Combine

protocol Fetchable {
    func fetch<T>(with urlComponent: URLComponents, session: URLSession) -> AnyPublisher<T,APIError> where T: Decodable
}

extension Fetchable {
    func fetch<T>(with urlComponent: URLComponents, session: URLSession) -> AnyPublisher<T,APIError> where T: Decodable {
        guard let url = urlComponent.url else {
            return Fail(error: APIError.request(message: "Invalid URL")).eraseToAnyPublisher()
        }
        
        let token = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5YjRkYWZkODZlNTc1OThjYmIyZWVhZWIzMTk0YThkZCIsInN1YiI6IjViZWYzNGI1MGUwYTI2MjY2MTAyMWE0YSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Zu_kTHzMrnFlr7r_-uHCIaeWCiBeXfEyY7y5bKnV97E"
        var request = URLRequest(url: url)
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = "GET"
        
        return session.dataTaskPublisher(for: request)
          .mapError { error in
             APIError.network(message: error.localizedDescription)
          }
          .flatMap(maxPublishers: .max(1)) { pair in
            decode(pair.data)
          }
          .eraseToAnyPublisher()
    }
}
