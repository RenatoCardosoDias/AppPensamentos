//
//  SettingsViewController.swift
//  AppPensamentos
//
//  Created by Renato on 06/09/22.
//

import UIKit

class SettingsViewController: UIViewController {
    
    
    @IBOutlet weak var sAutorefresh: UISwitch!
    @IBOutlet weak var slTimeInterval: UISlider!
    @IBOutlet weak var scColorScheme: UISegmentedControl!
    @IBOutlet weak var lbTimeInterval: UILabel!
    
    let config = Configuration.shared
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "Refresh"), object: nil, queue: nil) { <#Notification#> in
            self.formatView()
        }

        // Do any additional setup after loading the view.
    } //end override func viewDidLaod
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        formatView()
    }
    
    func formatView(){
        //formatando os dados e chamando quando a tela for aparecer
        //definindo o switch como on/off
        sAutorefresh.setOn(config.autorefresh, animated: false)
        //setando o valor do time
        slTimeInterval.setValue(Float(config.timeInterval), animated: false)
        //Definindo qual seguimento está selecionado
        scColorScheme.selectedSegmentIndex = config.colorScheme
        //mudando o label do intervalo do time
        changeTimeIntervalLabel(width: config.timeInterval)
    }
    
    //Mudar o valor após x segundos
    func changeTimeIntervalLabel(width value: Double){
        lbTimeInterval.text = "Mudar após \(Int(value)) segundos"
    }
    
    @IBAction func changeAutoRefresh(_ sender: UISwitch) {
        //dizer ao araquivo de configuração mudar o valor do autorefresh, dizendo se está On/Off
        config.autorefresh = sender.isOn
    }
    
    @IBAction func changeTimeInterval(_ sender: UISlider) {
        //recuperar o valor que foi utilizado, arredondar o valor usando a funcao round
        let value = Double(round(sender.value))
        //recuperar o valor que foi passado para o lbTimeInterval
        changeTimeIntervalLabel(width: value)
        //setar o valor no arquivo de configuração com o valor passado na Label do TimeIntervalLabel
        config.timeInterval = value
        
    }
    @IBAction func changeColorScheme(_ sender: UISegmentedControl) {
        //setando o valor config.colorShchem no arquivo de configuração
        config.colorScheme = sender.selectedSegmentIndex
    }
    
    
} //end class SettingsViewController
