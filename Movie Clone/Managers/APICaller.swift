//
//  APICaller.swift
//  Movie Clone
//
//  Created by Alwi Shihab on 24/09/22.
//

import Foundation

struct Constants {
    static let API_KEY = "146f213f7f57825fa9e1e43b7db04884"
    static let BASE_URL = "https://api.themoviedb.org"
}

enum APIError: Error{
    case failedToFetchData
}

class APICaller {
    static let shared = APICaller()
    
    func getMovieCredits(compeletion: @escaping (Result<[Title], Error>) -> Void) {
        
        guard let url = URL(string: "\(Constants.BASE_URL)/3/person/6161/movie_credits?api_key=\(Constants.API_KEY)") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do{
                let results = try JSONDecoder().decode(CastTitleResponse.self, from: data)
                compeletion(.success(results.cast))
            }catch{
                compeletion(.failure(APIError.failedToFetchData))
            }
        }
        task.resume()
    }
    
    func getTvCredits(compeletion: @escaping (Result<[Title], Error>) -> Void) {
        
        guard let url = URL(string: "\(Constants.BASE_URL)/3/person/6161/tv_credits?api_key=\(Constants.API_KEY)") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do{
                let results = try JSONDecoder().decode(CastTitleResponse.self, from: data)
                compeletion(.success(results.cast))
            }catch{
                compeletion(.failure(APIError.failedToFetchData))
            }
        }
        task.resume()
    }
    
    func getPopularMovies(compeletion: @escaping (Result<[Movie], Error>) -> Void) {
        
        guard let url = URL(string: "\(Constants.BASE_URL)/3/movie/popular?api_key=\(Constants.API_KEY)&page=1") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do{
                let results = try JSONDecoder().decode(MovieResponse.self, from: data)
                compeletion(.success(results.results))
            }catch{
                compeletion(.failure(APIError.failedToFetchData))
            }
        }
        task.resume()
    }
    
    func searchPopular(with query: String, compeletion: @escaping (Result<[Movie], Error>) -> Void) {
        
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {return}
        
        guard let url = URL(string:"\(Constants.BASE_URL)/3/search/movie?api_key=\(Constants.API_KEY)&query=\(query)&page=1&include_adult=true") else {
            return
        }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }

            do{
                let results = try JSONDecoder().decode(MovieResponse.self, from: data)
                compeletion(.success(results.results))
            }catch{
                compeletion(.failure(APIError.failedToFetchData))
            }
        }
        task.resume()
    }
}
