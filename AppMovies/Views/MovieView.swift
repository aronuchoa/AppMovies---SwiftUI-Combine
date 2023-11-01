//
//  MovieView.swift
//  AppMovies
//
//  Created by Aron Uchoa Bruno on 01/11/23.
//

import SwiftUI

struct MoviewView<Model>: View where Model:MovieListViewModelInterface {
    @StateObject private var viewModel: Model
    init (viewModel: Model) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        NavigationView {
            VStack {
                moviesFluctuationListView
            }
            .onAppear() {
                viewModel.fetchMovieList()
            }
        }
    }
    
    private var moviesFluctuationListView: some View {
        List(viewModel.movieList) { movie in
            NavigationLink(destination: DetailView(movie: movie)) {
                HStack {
                    Text("\(movie.title)")
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    MoviewView(viewModel: MockMovieViewModel(moviesFetcher: MoviesAPI()))
}
