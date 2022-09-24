//
//  APICaller.swift
//  Movie Clone
//
//  Created by Alwi Shihab on 24/09/22.
//

import Foundation

struct Constants {
    static let API_KEY = ""
    static let BASE_URL = "https://api.themoviedb.org"
}

enum APIError: Error{
    case failedToFetchData
}

class APICaller {
    static let shared = APICaller()
    
    func getMovieCredits(compeletion: @escaping (Result<[Cast], Error>) -> Void) {
        
        guard let url = URL(string: "\(Constants.BASE_URL)/3/person/6161/movie_credits?api_key=\(Constants.API_KEY)") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do{
                let results = try JSONDecoder().decode(MovieCreditsResponse.self, from: data)
                compeletion(.success(results.cast))
            }catch{
                compeletion(.failure(APIError.failedToFetchData))
            }
        }
        task.resume()
    }
    
    func getTvCredits(compeletion: @escaping (Result<[TvCast], Error>) -> Void) {
        
        guard let url = URL(string: "\(Constants.BASE_URL)/3/person/6161/tv_credits?api_key=\(Constants.API_KEY)") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do{
                let results = try JSONDecoder().decode(TvCreditsResponse.self, from: data)
                compeletion(.success(results.cast))
            }catch{
                compeletion(.failure(APIError.failedToFetchData))
            }
        }
        task.resume()
    }
    
    func getProfileImages(compeletion: @escaping (Result<[Profile], Error>) -> Void) {
        
        guard let url = URL(string: "\(Constants.BASE_URL)/3/person/6161/images?api_key=\(Constants.API_KEY)") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do{
                let results = try JSONDecoder().decode(ImagesResponse.self, from: data)
                compeletion(.success(results.profiles))
            }catch{
                compeletion(.failure(APIError.failedToFetchData))
            }
        }
        task.resume()
    }
}
