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
    
    @IBOutlet weak var iceCubePurchaseNumberLabel: UILabel!
    
    @IBOutlet weak var lemonMixNumberLabel: UILabel!
    
    @IBOutlet weak var iceCubeMixNumberLabel: UILabel!
    
    var dayCounter = 1
    var funds = 10
    var lemonInventory = 1
    var iceCubeInventory = 1
    
    var lemonPurchaseCounter = 0
    var iceCubePurchaseCounter = 0
    
    var lemonMixCounter = 0
    var iceCubeMixCounter = 0
    
    var lemonadeRatio = 1.0
    var preferenceList:[Double] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
                
        fundsLabel.text = "$\(funds)"
        lemonInventoryLabel.text = "\(lemonInventory) Lemon"
        iceCubeInventoryLabel.text = "\(iceCubeInventory) Ice Cube"
        lemonPurchaseNumberLabel.text = "\(lemonPurchaseCounter)"
        iceCubePurchaseNumberLabel.text = "\(iceCubePurchaseCounter)"
        lemonMixNumberLabel.text = "\(lemonMixCounter)"
        iceCubeMixNumberLabel.text = "\(iceCubeMixCounter)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addLemonPurchaseButtonPressed(sender: AnyObject) {
        if funds >= 2 {
            lemonPurchaseCounter += 1
            lemonPurchaseNumberLabel.text = "\(lemonPurchaseCounter)"
        
            lemonInventory += 1
            lemonInventoryLabel.text = "\(lemonInventory) Lemon(s)"
        
            funds -= 2
            fundsLabel.text = "$\(funds)"
        }
    }
    
    @IBAction func minusLemonPurchaseButtonPressed(sender: AnyObject) {
        if lemonPurchaseCounter > 0 {
            lemonPurchaseCounter -= 1
            lemonPurchaseNumberLabel.text = "\(lemonPurchaseCounter)"
        
            lemonInventory -= 1
            lemonInventoryLabel.text = "\(lemonInventory) Lemon(s)"
        
            funds += 2
            fundsLabel.text = "$\(funds)"
        }
    }
    
    @IBAction func addIceCubePurchaseButtonPressed(sender: AnyObject) {
        if funds >= 1 {
            iceCubePurchaseCounter += 1
            iceCubePurchaseNumberLabel.text = "\(iceCubePurchaseCounter)"
        
            iceCubeInventory += 1
            iceCubeInventoryLabel.text = "\(iceCubeInventory) Ice Cube(s)"
        
            funds -= 1
            fundsLabel.text = "$\(funds)"
        }
    }
    
    @IBAction func minusIceCubePurchaseButtonPressed(sender: AnyObject) {
        if iceCubePurchaseCounter > 0 {
            iceCubePurchaseCounter -= 1
            iceCubePurchaseNumberLabel.text = "\(iceCubePurchaseCounter)"
        
            iceCubeInventory -= 1
            iceCubeInventoryLabel.text = "\(iceCubeInventory) Ice Cube(s)"
        
            funds += 1
            fundsLabel.text = "$\(funds)"
        }
    }
    
    @IBAction func addLemonMixButtonPressed(sender: AnyObject) {
        if lemonInventory > 0 {
            lemonMixCounter += 1
            lemonMixNumberLabel.text = "\(lemonMixCounter)"
        
            lemonInventory -= 1
            lemonInventoryLabel.text = "\(lemonInventory) Lemon(s)"
        }
    }
    
    @IBAction func minusLemonMixButtonPressed(sender: AnyObject) {
        if lemonMixCounter > 0 {
            lemonMixCounter -= 1
            lemonMixNumberLabel.text = "\(lemonMixCounter)"
        
            lemonInventory += 1
            lemonInventoryLabel.text = "\(lemonInventory) Lemon(s)"
        }
    }
    
    @IBAction func addIceCubeMixButtonPressed(sender: AnyObject) {
        if iceCubeInventory > 0 {
            iceCubeMixCounter += 1
            iceCubeMixNumberLabel.text = "\(iceCubeMixCounter)"
        
            iceCubeInventory -= 1
            iceCubeInventoryLabel.text = "\(iceCubeInventory) Ice Cube(s)"
        }
    }
    
    @IBAction func minusIceCubeMixButtonPressed(sender: AnyObject) {
        if iceCubeMixCounter > 0 {
            iceCubeMixCounter -= 1
            iceCubeMixNumberLabel.text = "\(iceCubeMixCounter)"
        
            iceCubeInventory += 1
            iceCubeInventoryLabel.text = "\(iceCubeInventory) Ice Cube(s)"
        }
    }
    
    func mixLemonade() {
        lemonadeRatio = Double(lemonMixCounter) / Double(iceCubeMixCounter)
        println("The lemonade ratio is: \(lemonadeRatio).")
    }
    
    func createCustomers() {
        var numberOfCustomers = Int(arc4random_uniform(UInt32(11)))
        while numberOfCustomers == 0 {
            numberOfCustomers = Int(arc4random_uniform(UInt32(11)))
        }
        println("Number of customers: \(numberOfCustomers)")
        for var customer = 0; customer < numberOfCustomers; customer++ {
            var preference = ((Double(arc4random_uniform(UInt32(11))))/10.0)
            while preference == 0.0 {
                preference = ((Double(arc4random_uniform(UInt32(11))))/10.0)
            }
            preferenceList += [preference]
        }
        println("\(preferenceList)")
    }
    
    func sellLemonade() {
        for customerPreference in preferenceList {
            if customerPreference < 0.4 && lemonadeRatio > 1.0 {
                funds += 1
                println("Paid.")
            }
            else if customerPreference >= 0.4 && customerPreference <= 0.6 && lemonadeRatio == 1 {
                funds += 1
                println("Paid.")
            }
            else if customerPreference > 0.6 && lemonadeRatio < 1.0 {
                funds += 1
                println("Paid.")
            }
            else {
                println("Not paid.")
            }
        }
    }
    
    func closeLemonadeStand(){
        lemonadeRatio = 0.0
        preferenceList = []
        fundsLabel.text = ("$\(funds)")
        lemonPurchaseNumberLabel.text = "0"
        iceCubePurchaseNumberLabel.text = "0"
        lemonPurchaseCounter = 0
        iceCubePurchaseCounter = 0
        lemonMixNumberLabel.text = "0"
        lemonMixCounter = 0
        iceCubeMixNumberLabel.text = "0"
        iceCubeMixCounter = 0
    }
    
    @IBAction func startDayButtonPressed(sender: AnyObject) {
        mixLemonade()
        createCustomers()
        sellLemonade()
        closeLemonadeStand()
        dayCounter += 1
        println("\(dayCounter)")
    }
}

