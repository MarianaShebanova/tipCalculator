//
//  ViewController.swift
//  Tippy
//
//  Created by mariana on 3/4/17.
//  Copyright © 2017 mariana. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var tAnimation: UILabel!
    @IBOutlet weak var pAnimation: UILabel!
    @IBOutlet weak var iAnimation: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func Tap(_ sender: AnyObject) {
        view.endEditing(true)
    }

    //Calcualte tip for Tip and Total fields
    private func CalculateTip() {
        let tipPersentages = [0.15, 0.2, 0.25]
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPersentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    //Calcualte tip for Tip and Total when tip persentage was changed
    @IBAction func CalculateTip(_ sender: AnyObject) {
        CalculateTip()
    }
    
    //Set default tip persentage and update the Tip and Total
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = UserDefaults.standard
        let intValue = defaults.integer(forKey: "default_tip_persentage_index")
        tipControl.selectedSegmentIndex = intValue
        CalculateTip()
        let theme = ThemeManager.currentTheme()
        ThemeManager.applyTheme(theme: theme)
        self.navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: theme.mainColor]
        self.billField.textColor = theme.mainColor
        self.tAnimation.alpha = 0
        self.iAnimation.alpha = 0
        self.pAnimation.alpha = 0
    }
    
    //Animation for T I P
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration:3, delay: 1, options: UIViewAnimationOptions.curveEaseOut, animations: {
            self.tAnimation.alpha = 1
            self.iAnimation.alpha = 1
            self.pAnimation.alpha = 1
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    //Save current tip persentage
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        let defaults = UserDefaults.standard
        defaults.set(tipControl.selectedSegmentIndex, forKey: "default_tip_persentage_index")
        defaults.synchronize()
    }
}

