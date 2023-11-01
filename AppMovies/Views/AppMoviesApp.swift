//
//  AppMoviesApp.swift
//  AppMovies
//
//  Created by Aron Uchoa Bruno on 01/11/23.
//

import SwiftUI

@main
struct AppMoviesApp: App {
    let viewModel = MovieListViewModel(moviesFetcher: MoviesAPI())
    var body: some Scene {
        WindowGroup {
            MoviewView(viewModel: viewModel)
        }
    }
}
