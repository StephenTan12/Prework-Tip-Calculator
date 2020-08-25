//
//  SettingsViewController.swift
//  tip
//
//  Created by Stephen Tan on 8/24/20.
//  Copyright © 2020 Stephen Tan. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var defaultTipPercent: UISegmentedControl!
    let defaults = UserDefaults.standard
    
    @IBAction func defaultTipPercent(_ sender: Any) {
        switch defaultTipPercent.selectedSegmentIndex
        {
        case 0:
            defaults.set(0, forKey: "tipIndex")
            defaults.synchronize()
        case 1:
            defaults.set(1, forKey: "tipIndex")
            defaults.synchronize()
        case 2:
            defaults.set(2, forKey: "tipIndex")
            defaults.synchronize()
        default:
            break
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        defaultTipPercent.selectedSegmentIndex = defaults.integer(forKey: "tipIndex")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
