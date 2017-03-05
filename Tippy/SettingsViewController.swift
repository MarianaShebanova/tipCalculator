//
//  SettingsViewController.swift
//  Tippy
//
//  Created by mariana on 3/4/17.
//  Copyright © 2017 mariana. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Set default tip persentage
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = UserDefaults.standard
        let intValue = defaults.integer(forKey: "default_tip_persentage_index")
        tipControl.selectedSegmentIndex = intValue
    }
    
    //Save current tip persentage
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        let defaults = UserDefaults.standard
        defaults.set(tipControl.selectedSegmentIndex, forKey: "default_tip_persentage_index")
        defaults.synchronize()
    }
    
}
