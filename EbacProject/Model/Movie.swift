//
//  Movie.swift
//  EbacProject
//
//  Created by Kleiton Mendes de Brito on 18/04/23.
//

import Foundation

struct MovieResults: Codable {
    let results: [Movie]
}

struct Movie: Codable {
    let id: Int
    let title: String
    let releaseDate: String
    let image: String?
    let overview: String
    let voteAverage: Double
    
    private enum CodingKeys: String, CodingKey {
         case id
         case title
         case releaseDate = "release_date"
         case image = "poster_path"
         case overview
         case voteAverage = "vote_average"
    }
    
}
