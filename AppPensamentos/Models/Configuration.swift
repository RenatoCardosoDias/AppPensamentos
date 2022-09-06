//
//  Configuration.swift
//  AppPensamentos
//
//  Created by Renato on 06/09/22.
//

import Foundation

enum UserDefaultsKeys: String{
    case timeInterval = "timeInterval"
    case colorScheme = "colorScheme"
    case autorefresh = "autorefresh"
}

class Configuration {
    //Persistindo dados com UserDefaults
    //armazendo na variavel defaults as preferencias do usuario
    let defaults = UserDefaults.standard
    //configurando uma variavel global
    static var shared: Configuration = Configuration()
    
    var timeInterval: Double {
        get {
            //recuprando uma informação
            return defaults.double(forKey: UserDefaultsKeys.timeInterval.rawValue)
        }
    }
    
    //construindo um inicializador privado
    private init() {
        
    }
    
    
} //end class Configuration
