//
//  RAMCharacter.swift
//  Elad'sproject
//
//  Created by elad schwartz on 25/02/2022.
//

import Foundation

struct RAMResults : Decodable
{
    let results : [RAMCharacter]
}

struct RAMCharacter : Decodable
{
    let id      : Int?
    let name    : String?
    let status  : String?
    let species : String?
    let type    : String?
    let gender  : String?
    let origin  : RAMOrigin?
    let location: RAMLocation?
    let imager  : String?
    let episode : [String]?
    let url     : String?
}

struct RAMOrigin : Decodable
{
    let name : String
    let url  : String
}
