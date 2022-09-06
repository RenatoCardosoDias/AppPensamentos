//
//  Quote.swift
//  AppPensamentos
//
//  Created by Renato on 06/09/22.
//

import Foundation

struct Quote: Codable { //Encodable, Decodable
    let quote: String
    let author: String
    let image: String
    
    var quoteFormatted: String {
        return "〝" + quote + "〞"
    }
    var authorFormatted: String {
        return "- " + author + " -"
    }
    
    
} //end struct Quote
