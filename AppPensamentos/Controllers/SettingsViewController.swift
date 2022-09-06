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
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    } //end override func viewDidLaod
    
    @IBAction func changeAutoRefresh(_ sender: UISwitch) {
    }
    
    @IBAction func changeTimeInterval(_ sender: UISlider) {
    }
    @IBAction func changeColorScheme(_ sender: UISegmentedControl) {
    }
    
    
} //end class SettingsViewController
