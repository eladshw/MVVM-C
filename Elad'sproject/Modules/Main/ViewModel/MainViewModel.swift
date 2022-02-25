//
//  MainViewModel.swift
//  Elad'sproject
//
//  Created by elad schwartz on 25/02/2022.
//

import Foundation

struct MainViewModel
{
    let apiService = ApiManager.shared
    
    func getCharacters()
    {
        apiService.getCharacters { result in
            switch result
            {
                case .success(let char): print(char)
                case .failure(let error) : print(error)
            }
        }
    }
    
    func getLocation(url: String)
    {
        apiService.getLocation(url: url) { result in
            switch result
            {
                case .success(let location): print(location)
                case .failure(let error) : print(error)
            }
        }
    }
}
