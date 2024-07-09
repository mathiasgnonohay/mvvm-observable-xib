//
//  NetworkConstant.swift
//  FeaturedMovie
//
//  Created by Mathias Nonohay on 04/07/24.
//

import Foundation

class NetworkConstant {
    
    public static var shared: NetworkConstant = NetworkConstant()
    
    private init() { /*Singleton Pattern*/ }
    
    public var apiKey: String {
        get {
            "96dd278d45abf85bc179831d48f22e83"
        }
    }
    
    public var serverAddress: String {
        get {
            "https://api.themoviedb.org/3/"
        }
    }
    
    public var imageServerAdress: String {
        get {
            "https://image.tmdb.org/t/p/w500/"
        }
    }
}
