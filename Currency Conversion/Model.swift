//
//  Model.swift
//  Currency Conversion
//
//  Created by Burak Kaya on 17.01.2021.
//

import Foundation

struct Currency : Codable {
    let rates : Rate
    let base : String
    let date : String
}

struct Rate : Codable{
    let eur : Double
    let usd : Double
    
    enum CodingKeys: String, CodingKey {
               case eur = "EUR"
               case usd = "USD"
       }
}
