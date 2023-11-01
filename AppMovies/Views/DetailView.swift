//
//  DetailView.swift
//  AppMovies
//
//  Created by Aron Uchoa Bruno on 01/11/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct DetailView: View {
    
    @State var movie: Movie
    
    var body: some View {
        WebImage(url: URL(string: ImagesAPI().imageBaseURL + PosterSizes.w185.rawValue + movie.posterPath))
        Text(movie.title)
            .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
        Text(movie.overview)
            .padding(EdgeInsets(top: 0, leading: 16, bottom: 16, trailing: 16))
    }
}

#Preview {
    DetailView(movie: Movie(id: 1234, posterPath: ImagesAPI().imageBaseURL + PosterSizes.w185.rawValue + "/oUmmY7QWWn7OhKlcPOnirHJpP1F.jpg", title: "Retribution", overview: "When a mysterious caller puts a bomb under his car seat, Matt Turner begins a high-speed chase across the city to complete a specific series of tasks. With his kids trapped in the back seat and a bomb that will explode if they get out of the car, a normal commute becomes a twisted game of life or death as Matt follows the stranger's increasingly dangerous instructions in a race against time to save his family."))
}
