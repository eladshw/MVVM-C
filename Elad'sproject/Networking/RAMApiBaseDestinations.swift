//
//  RAMApiBaseDestinations.swift
//  Elad'sproject
//
//  Created by elad schwartz on 25/02/2022.
//

import Foundation
enum APIBaseDestinations
{
    case getCharacters
    case getLocation(String)
}

extension APIBaseDestinations
{
    private var host : String
    {
        "rickandmortyapi.com"
    }
  
    private var scheme: String
    {
        return "https"
    }
    
    var path: String
    {
        switch self
        {
        case .getCharacters         : return "/api/character"
        case .getLocation(let url)  : return "/api/location\(url)"
        }
    }
    
    var baseURL: URL
    {
        var components      = URLComponents()
        components.scheme   = scheme
        components.host     = host
        components.path     = path
        
        guard let url = components.url else { fatalError("could not convert components to URL Object") }
        
        return url
    }
}
