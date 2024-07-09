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
    static func getTrendingMovies(completionHandler: @escaping(_ result: Result<TrendingMovieModel, NetworkError>) -> Void) {
        let urlString = NetworkConstant.shared.serverAddress + "trending/all/days?api_key=" + NetworkConstant.shared.apiKey
        guard let url = URL(string: urlString) else { 
            completionHandler(.failure(.urlError))
            return
        }
        
        URLSession.shared.dataTask(with: url) { dataResposee, response, error in
            
            if error == nil,
               let data = dataResposee,
               let resultData = try? JSONDecoder().decode(TrendingMovieModel.self, from: data) {
                completionHandler(.success(resultData))
            } else {
                completionHandler(.failure(.cannotParseData))
            }
            
            
        }.resume()
    }
}
