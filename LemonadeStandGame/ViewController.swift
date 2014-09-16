//
//  ViewController.swift
//  LemonadeStandGame
//
//  Created by thomas on 9/16/14.
//  Copyright (c) 2014 thomas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var fundsLabel: UILabel!
    
    @IBOutlet weak var lemonInventoryLabel: UILabel!
    
    @IBOutlet weak var iceCubeInventoryLabel: UILabel!
    
    @IBOutlet weak var weatherImage: UIImageView!
    
    @IBOutlet weak var lemonPurchaseNumberLabel: UILabel!
    
    @IBOutlet weak var minusLemonPurchaseButton: UIButton!
    
    @IBOutlet weak var iceCubePurchaseNumberLabel: UILabel!
    
    @IBOutlet weak var minusIceCubePurchaseButton: UIButton!
    
    @IBOutlet weak var lemonMixNumberLabel: UILabel!
    
    @IBOutlet weak var minusLemonMixButton: UIButton!
    
    @IBOutlet weak var minusIceCubeMixButton: UIButton!
    
    @IBOutlet weak var iceCubeMixNumberLabel: UILabel!
    
    var dayCounter = 1
    var funds = 10
    var lemonInventory = 1
    var iceCubeInventory = 1
    var lemonPurchaseCounter = 0
    var iceCubePurchaseCounter = 0
    var lemonMixCounter = 0
    var iceCubeMixCounter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
                
        fundsLabel.text = "$\(funds)"
        
        lemonInventoryLabel.text = "\(lemonInventory) Lemon"
        
        iceCubeInventoryLabel.text = "\(iceCubeInventory) Ice Cube"
        
        lemonPurchaseNumberLabel.text = "\(lemonPurchaseCounter)"
        
        if lemonPurchaseCounter == 0 {
            minusLemonPurchaseButton.hidden = true
        }
        
        iceCubePurchaseNumberLabel.text = "\(iceCubePurchaseCounter)"
        
        if iceCubePurchaseCounter == 0 {
            minusIceCubePurchaseButton.hidden = true
        }
        
        lemonMixNumberLabel.text = "\(lemonMixCounter)"
        
        if lemonMixCounter == 0 {
            minusLemonMixButton.hidden = true
        }
        
        iceCubeMixNumberLabel.text = "\(iceCubeMixCounter)"
        
        if iceCubeMixCounter == 0 {
            minusIceCubeMixButton.hidden = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addLemonPurchaseButtonPressed(sender: AnyObject) {
        lemonPurchaseCounter += 1
        lemonPurchaseNumberLabel.text = "\(lemonPurchaseCounter)"
        minusLemonPurchaseButton.hidden = false
    }
    
    @IBAction func minusLemonPurchaseButtonPressed(sender: AnyObject) {
        lemonPurchaseCounter -= 1
        lemonPurchaseNumberLabel.text = "\(lemonPurchaseCounter)"
        if lemonPurchaseCounter == 0 {
            minusLemonPurchaseButton.hidden = true
        } else {
            minusLemonPurchaseButton.hidden = false
        }
    }
    
    @IBAction func addIceCubePurchaseButtonPressed(sender: AnyObject) {
        iceCubePurchaseCounter += 1
        iceCubePurchaseNumberLabel.text = "\(iceCubePurchaseCounter)"
        minusIceCubePurchaseButton.hidden = false
    }
    
    @IBAction func minusIceCubePurchaseButtonPressed(sender: AnyObject) {
        iceCubePurchaseCounter -= 1
        iceCubePurchaseNumberLabel.text = "\(iceCubePurchaseCounter)"
        if iceCubePurchaseCounter == 0 {
            minusIceCubePurchaseButton.hidden = true
        } else {
            minusIceCubePurchaseButton.hidden = false
        }
    }
    
    @IBAction func addLemonMixButtonPressed(sender: AnyObject) {
        lemonMixCounter += 1
        lemonMixNumberLabel.text = "\(lemonMixCounter)"
        minusLemonMixButton.hidden = false
    }
    
    @IBAction func minusLemonMixButtonPressed(sender: AnyObject) {
        lemonMixCounter -= 1
        lemonMixNumberLabel.text = "\(lemonMixCounter)"
        if lemonMixCounter == 0 {
            minusLemonMixButton.hidden = true
        } else {
            minusLemonMixButton.hidden = false
        }
    }
    
    @IBAction func addIceCubeMixButtonPressed(sender: AnyObject) {
        iceCubeMixCounter += 1
        iceCubeMixNumberLabel.text = "\(iceCubeMixCounter)"
        minusIceCubeMixButton.hidden = false
    }
    
    @IBAction func minusIceCubeMixButtonPressed(sender: AnyObject) {
        iceCubeMixCounter -= 1
        iceCubeMixNumberLabel.text = "\(iceCubeMixCounter)"
        if iceCubeMixCounter == 0 {
            minusIceCubeMixButton.hidden = true
        } else {
            minusIceCubeMixButton.hidden = false
        }
    }
    
    func updateInventory() {
        
    }
    
    @IBAction func startDayButtonPressed(sender: AnyObject) {
    }
}

