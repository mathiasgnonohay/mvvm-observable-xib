//
//  APICaller.swift
//  FeaturedMovie
//
//  Created by Mathias Nonohay on 04/07/24.
//

import Foundation

enum NetworkError: Error {
    case urlError
    case cannotParseData
}

public class APICaller {
    
    private init() { }
    
    static func getTrendingMovies(completionHandler: @escaping(_ result: Result<TrendingMovieModel, NetworkError>) -> Void) {
        let urlString = NetworkConstant.shared.serverAddress + "trending/all/day?api_key=" + NetworkConstant.shared.apiKey
        guard let url = URL(string: urlString) else { 
            completionHandler(.failure(.urlError))
            return
        }
        
        URLSession.shared.dataTask(with: url) { dataRespose, response, error in
            
            if error == nil,
               let data = dataRespose,
               let resultData = try? JSONDecoder().decode(TrendingMovieModel.self, from: data) {
                completionHandler(.success(resultData))
            } else {
                completionHandler(.failure(.cannotParseData))
            }
        }.resume()
    }
}
