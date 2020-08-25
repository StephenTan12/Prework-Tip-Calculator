//
//  ViewController.swift
//  tip
//
//  Created by Stephen Tan on 8/24/20.
//  Copyright © 2020 Stephen Tan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        billAmountTextField.keyboardType = UIKeyboardType.decimalPad
        // Do any additional setup after loading the view.
        self.title = "Tip Calculator"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        billAmountTextField.becomeFirstResponder()
        print("view will appear")
        // This is a good place to retrieve the default tip percentage from UserDefaults
        // and use it to update the tip amount
        let tipIndex = defaults.integer(forKey: "tipIndex")
        tipControl.selectedSegmentIndex = tipIndex
        print(tipIndex)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did disappear")
    }
    
    @IBAction func onTap(_ sender: Any) {
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        
        let bill = Double(billAmountTextField.text!) ?? 0
        let tipPercentages = [0.15, 0.18, 0.2]
        
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = tip + bill
        
        guard let formattedTip = numberFormatter.string(from: NSNumber(value: tip)) else { return }
        guard let formattedTotal = numberFormatter.string(from: NSNumber(value: total)) else { return }
        
        tipPercentageLabel.text = formattedTip
        totalLabel.text = formattedTotal
    }
}

