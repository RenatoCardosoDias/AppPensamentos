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
        } //end get
        set {
            //setando a informaçnao recuprada
            defaults.set(newValue, forKey: UserDefaultsKeys.timeInterval.rawValue)
        } //end set
    } //end var timeInterval: Double
    
    var colorScheme: Int {
        get {
            //recuprando uma informação
            return defaults.integer(forKey: UserDefaultsKeys.colorScheme.rawValue)
        } //end get
        set {
            //setando a informaçnao recuprada
            defaults.set(newValue, forKey: UserDefaultsKeys.colorScheme.rawValue)
        } //end set
    } //end var colorScheme : Int
    
    
    var autorefresh: Bool {
        get {
            //recuprando uma informação
            return defaults.bool(forKey: UserDefaultsKeys.autorefresh.rawValue)
        } //end get
        set {
            //setando a informaçnao recuprada
            defaults.set(newValue, forKey: UserDefaultsKeys.autorefresh.rawValue)
        } //end set
    } //end var autorefresh: Bool
    
    
    //construindo um inicializador privado
    private init() {
        //deixando o valor do autofrefesh como false pois o valor é boleano, ir até o swtich e desabilitar -  off, para que ao recuperar o valor nao entrar em conflito, pois como nunca foi recurapdo o valor o mesmo incializa com false, assim devemos desabilitar
        //se o valor for igual a zero não existe nada lá
        if defaults.double(forKey: UserDefaultsKeys.timeInterval.rawValue) == 0 {
            //vamos armazenar o valor padrão que foi definido como 8.0
            defaults.set(8.0, forKey: UserDefaultsKeys.timeInterval.rawValue)
        } //end if defaults.double
    } //end private init
    
    
} //end class Configuration
