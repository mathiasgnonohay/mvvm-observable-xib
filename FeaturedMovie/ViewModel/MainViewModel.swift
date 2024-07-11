//
//  MainViewModel.swift
//  FeaturedMovie
//
//  Created by Mathias Nonohay on 03/07/24.
//

import UIKit

class MainViewModel {
    
    var isLoading: Observable<Bool> = Observable(false)
    var dataSource: TrendingMovieModel?
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRows(in section: Int) -> Int {
        return 5
    }
    
    func getData() {
        if isLoading.value ?? true { return }
        
        isLoading.value = true
        
        APICaller.getTrendingMovies { [weak self] result in
            guard let self else { return }
            
            self.isLoading.value = false
            
            switch result {
            case .success(let data):
                print("API Caller getTrendingMovie did finish with success: \(data.results.count)")
                self.dataSource = data
            case .failure(let error):
                print("API Caller getTrendingMovie did finish with error: \(error)")
            }
        }
    }
}
