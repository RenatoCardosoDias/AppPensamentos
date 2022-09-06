//
//  Configuration.swift
//  AppPensamentos
//
//  Created by Renato on 06/09/22.
//

import Foundation

class Configuration {
    //Persistindo dados com UserDefaults
    //armazendo na variavel defaults as preferencias do usuario
    let defaults = UserDefaults.standard
    //configurando uma variavel global
    static var shared: Configuration = Configuration()
    
    //construindo um inicializador privado
    private init() {
        
    }
    
    
} //end class Configuration
