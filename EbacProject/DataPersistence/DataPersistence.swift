//
//  DataPersistence.swift
//  EbacProject
//
//  Created by Kleiton Mendes de Brito on 19/04/23.
//

import Foundation
import UIKit
import CoreData

enum DataBaseError: Error {
    case failedToSaveData
    case failedToFetchData
    case failedToDeleteData
}

class DataPersistenceManager {
    
    static let shared = DataPersistenceManager()
    
    
    //MARK: - Persistent Container
    
    func watchListMovieResultWith(model: Movie, completion: @escaping ((Result<Void, Error>)->Void)) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        
        let context = appDelegate.persistentContainer.viewContext
        
        let item = MovieResultItem(context: context)
        
        item.id = Int64(model.id)
        item.title = model.title
        item.releaseDate = model.releaseDate
        item.image = model.image!
        item.overview = model.overview
        item.voteAverage = model.voteAverage
        do {
            try context.save()
            completion(.success(()))
        } catch {
            print(completion(.failure(DataBaseError.failedToSaveData)))
        }
        
    }
    
    
    //MARK: - Context manager
    
    func fetchingWatchListFromDataBase(completion: @escaping (Result<[MoviePersistence], Error>) -> Void) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let context = appDelegate.persistentContainer.viewContext
        
        let request: NSFetchRequest<MoviePersistence>
        
        request = MoviePersistence.fetchRequest()
        
        do {
            try context.save()
            let movies = try context.fetch(request)
            completion(.success(movies))
            
            
        } catch {
            completion(.failure(DataBaseError.failedToFetchData))
            
        }
        
    }
    
    //MARK: - Delete item from localstorage
    
    func deleteWatchlistWith(model: MoviePersistence, completion: @escaping (Result<Void, Error>) -> Void) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let context = appDelegate.persistentContainer.viewContext
        
        context.delete(model)
        
        do {
            try context.save()
            completion(.success(()))
        } catch {
            completion(.failure(DataBaseError.failedToDeleteData))
            
        }
        
    }
}
