//
//  MovieViewModel.swift
//  EbacProject
//
//  Created by Kleiton Mendes de Brito on 18/04/23.
//

import Foundation

class MovieViewModel: MovieNetworkApiProtocol {
    
    private var moviesModel = [Movie]()
    private let movieNetworkApi : Network? = nil
    
    func success(movies: [MovieResults]) {
        self.moviesModel = movies[0].results
    }
    
    func error(error: Error) {
        print("Error loading movies")
    }
}
