//
//  MovieViewModel.swift
//  AppMovies
//
//  Created by Aron Uchoa Bruno on 01/11/23.
//

import Foundation
import Combine

protocol MovieListViewModelInterface: ObservableObject {
    var movieList: [Movie] { get set }
    init(moviesFetcher: MoviesFetchable)
    func fetchMovieList()
    func shouldLoadData(movie: Movie) -> Bool
}

class MovieListViewModel {
    @Published var movieList: [Movie]
    @Published var currentPage: String = "1"
    private let moviesFetcher: MoviesFetchable
    private var disposables = Set<AnyCancellable>()

    required init(moviesFetcher: MoviesFetchable) {
        self.moviesFetcher = moviesFetcher
        self.movieList = [Movie]()
    }
}

//MARK: - MoviesListViewModelInterface Extension

extension MovieListViewModel: MovieListViewModelInterface {
    func fetchMovieList() {
        moviesFetcher
            .fetchMoviesList(page: self.currentPage)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] value in
                switch value {
                case .failure:
                    self?.movieList = []
                case .finished:
                    break
                }
            } receiveValue: { [weak self] moviesResponse in
                if let movies = moviesResponse.results, let page = moviesResponse.page {
                    self?.movieList.append(contentsOf: movies)
                    self?.currentPage = String(page + 1)
                }
            }
            .store(in: &disposables)
    }
    
    func shouldLoadData(movie: Movie) -> Bool {
        return movie == self.movieList.last
    }
}
