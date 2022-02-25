//
//  ApiManager.swift
//  Elad'sproject
//
//  Created by elad schwartz on 25/02/2022.
//

import Foundation

final class ApiManager
{
    typealias getCharactersCompletion = (Result<RAMResults, Error>) -> Void
    typealias getLocationCompletion = (Result<RAMLocation, Error>) -> Void
    
    static let shared = ApiManager()
    
    private let defaultSession = URLSession(configuration: .default)
    
    private init(){}
    
    func getCharacters(completion: @escaping getCharactersCompletion)
    {
        let url = APIBaseDestinations.getCharacters.baseURL
        
        let task = defaultSession.dataTask(with: url) { data,response, error in
            guard let httpResponse  = response as? HTTPURLResponse, (200..<300).contains(httpResponse.statusCode) else { return }
            guard let data          = data else { return }
            
            guard let jsonResult = try? JSONDecoder().decode(RAMResults.self, from: data) else { return }
            completion(.success(jsonResult))
        }
        task.resume()
    }
    
    func getLocation(url: String, completion: @escaping getLocationCompletion)
    {
        let subStringUrl = getLocationUrl(from: url)
        let url = APIBaseDestinations.getLocation(subStringUrl).baseURL
        
        let task = defaultSession.dataTask(with: url) { data,response, error in
            guard let httpResponse  = response as? HTTPURLResponse, (200..<300).contains(httpResponse.statusCode) else { return }
            guard let data          = data else { return }
            
            guard let jsonResult = try? JSONDecoder().decode(RAMLocation.self, from: data) else { return }
            completion(.success(jsonResult))
        }
        task.resume()
    }
    
    private func getLocationUrl(from url: String) -> String
    {
        if let indexOfLocation = url.lastIndex(of: "/")
        {
            let subString = url.suffix(from: indexOfLocation)
            print(subString)
            return String(subString)
        }
        return ""
    }
}
