//
//  MockMovieViewModel.swift
//  AppMovies
//
//  Created by Aron Uchoa Bruno on 01/11/23.
//

import Foundation

class MockMovieViewModel: MovieListViewModelInterface {
    @Published var movieList: [Movie]
    private let moviesFetcher: MoviesFetchable
    required init(moviesFetcher: MoviesFetchable) {
        self.moviesFetcher = moviesFetcher
        self.movieList = [
            Movie(id: 951491, posterPath: "/aQPeznSu7XDTrrdCtT5eLiu52Yu.jpg", title: "Saw X", overview: "Between the events of 'Saw' and 'Saw II', a sick and desperate John Kramer travels to Mexico for a risky and experimental medical procedure in hopes of a miracle cure for his cancer, only to discover the entire operation is a scam to defraud the most vulnerable. Armed with a newfound purpose, the infamous serial killer returns to his work, turning the tables on the con artists in his signature visceral way through devious, deranged, and ingenious traps."),
            Movie(id: 507089, posterPath: "/A4j8S6moJS2zNtRR8oWF08gRnL5.jpg", title: "Five Nights at Freddy's", overview: "Recently fired and desperate for work, a troubled young man named Mike agrees to take a position as a night security guard at an abandoned theme restaurant: Freddy Fazbear's Pizzeria. But he soon discovers that nothing at Freddy's is what it seems."),
            Movie(id: 762430, posterPath: "/oUmmY7QWWn7OhKlcPOnirHJpP1F.jpg", title: "Retribution", overview: "When a mysterious caller puts a bomb under his car seat, Matt Turner begins a high-speed chase across the city to complete a specific series of tasks. With his kids trapped in the back seat and a bomb that will explode if they get out of the car, a normal commute becomes a twisted game of life or death as Matt follows the stranger's increasingly dangerous instructions in a race against time to save his family.")
        ]
    }
    func fetchMovieList() {  }
    
    func shouldLoadData(movie: Movie) -> Bool { return true }
}
