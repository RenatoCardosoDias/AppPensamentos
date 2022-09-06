//
//  QuotesManager.swift
//  AppPensamentos
//
//  Created by Renato on 06/09/22.
//

import Foundation


class QuotesManager {
    
    let quotes : [Quote]
    
    init() {
        let fileURL = Bundle.main.url(forResource: "quotes", withExtension: "json")!
        //let fileURL = Bundle.main.url(forResource: "quotes.json", withExtension: "nil")! // as duas formas estão corretas
        let jsonData = try! Data(contentsOf: fileURL)
        let jsonDecoder = JSONDecoder()
        quotes = try! jsonDecoder.decode([Quote].self, from: jsonData)
    } //end init
    
    
    //criando uma função aleatória que retorna um pensamento
    func getRandomQuote() -> Quote {
        let index = Int(arc4random_uniform(UInt32(quotes.count)))
        return quotes[index]
    } //end func getRandomQuote
} //end class QuotesManager
