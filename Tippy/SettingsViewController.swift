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
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var themeLabel: UILabel!
    @IBOutlet weak var themeControl: UISegmentedControl!
    
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
        tipControl.selectedSegmentIndex = defaults.integer(forKey: "default_tip_persentage_index")
        themeControl.selectedSegmentIndex = defaults.integer(forKey: "default_theme_index")
    }
    
    //Save current tip persentage
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        let defaults = UserDefaults.standard
        defaults.set(tipControl.selectedSegmentIndex, forKey: "default_tip_persentage_index")
        defaults.set(themeControl.selectedSegmentIndex, forKey: "default_theme_index")
        defaults.synchronize()
    }
    
    @IBAction func changeTheme(_ sender: AnyObject) {
        let theme = ThemeManager.getTheme(theme: themeControl.selectedSegmentIndex)
        ThemeManager.applyTheme(theme: theme)
        tipLabel.textColor = theme.mainColor
        themeLabel.textColor = theme.mainColor
    }
}
