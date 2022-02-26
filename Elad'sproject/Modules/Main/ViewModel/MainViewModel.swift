//
//  MainViewModel.swift
//  Elad'sproject
//
//  Created by elad schwartz on 25/02/2022.
//

import Foundation
import Combine


protocol MainViewModelDelegate : AnyObject
{
    func didSelect(character: RAMCharacter)
}

class MainViewModel
{
    let apiService = ApiManager.shared
    weak var delegate : MainViewModelDelegate?
    
    @Published private(set) var characters : [RAMCharacter] = []
    
    func getCharacters()
    {
        apiService.getCharacters {[weak self] result in
            guard let self = self else { return }
            
            switch result
            {
                case .success(let data)  : self.characters = data.results
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
    
    var numbersOfCharacters : Int
    {
        characters.count
    }
    
    func getInfoViewModel(at index: Int) -> InfoViewModel
    {
        return InfoViewModel(character: characters[index])
    }
}

extension MainViewModel : MainTableControllerDelegate
{
    func didSelect(character: RAMCharacter)
    {
        delegate?.didSelect(character: character)
    }
}
 
