//
//   MovieResultItem+CoreDataProperties.swift
//  EbacProject
//
//  Created by Kleiton Mendes de Brito on 19/04/23.
//

import Foundation
import CoreData


extension MovieResultItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MoviePersistence> {
        return NSFetchRequest<MoviePersistence>(entityName: "MoviePersistence")
    }

    @NSManaged public var id: Int64
    @NSManaged public var title: String?
    @NSManaged public var releaseDate: String?
    @NSManaged public var image: String?
    @NSManaged public var overview: String?
    @NSManaged public var voteAverage: Double
}

extension MovieResultItem : Identifiable {

}
