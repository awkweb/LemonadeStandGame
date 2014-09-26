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
    
    var dayCounter = 0
    var funds = 10
    var fundsCounter = 0
    var lemonInventory = 1
    var iceCubeInventory = 1
    
    var lemonPurchaseCounter = 0
    var iceCubePurchaseCounter = 0
    
    var lemonMixCounter = 0
    var iceCubeMixCounter = 0
    
    var lemonadeRatio = 1.0
    var preferenceList:[Double] = []
    
    var numberOfCustomers = 0

    var weatherEffect = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var myAlertView = UIAlertView()
        
        myAlertView.title = "Welcome"
        myAlertView.message = "Maintain a profit selling lemonade. Good luck!"
        myAlertView.addButtonWithTitle("Play")
        
        myAlertView.show()
                
        fundsLabel.text = "$\(funds)"
        lemonInventoryLabel.text = "\(lemonInventory) Lemon"
        iceCubeInventoryLabel.text = "\(iceCubeInventory) Ice Cube"
        lemonPurchaseNumberLabel.text = "\(lemonPurchaseCounter)"
        iceCubePurchaseNumberLabel.text = "\(iceCubePurchaseCounter)"
        lemonMixNumberLabel.text = "\(lemonMixCounter)"
        iceCubeMixNumberLabel.text = "\(iceCubeMixCounter)"
        
        weatherForecast()
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
    }
    
    func weatherForecast() {
        var randomWeather = Int(arc4random_uniform(UInt32(3)))
        switch randomWeather {
        case 0:
            weatherImage.image = UIImage(named:"mild.png")
            weatherEffect = 0
        case 1:
            weatherImage.image = UIImage(named:"cold.png")
            weatherEffect = -3
        case 2:
            weatherImage.image = UIImage(named:"warm.png")
            weatherEffect = 4
        default:
            weatherEffect = 0
        }
    }
    
    func createCustomers() {
        numberOfCustomers = Int(arc4random_uniform(UInt32(11)))
        while numberOfCustomers == 0 {
            numberOfCustomers = Int(arc4random_uniform(UInt32(11)))
        }
        numberOfCustomers += weatherEffect
        for var customer = 0; customer < numberOfCustomers; customer++ {
            var preference = ((Double(arc4random_uniform(UInt32(11))))/10.0)
            while preference == 0.0 {
                preference = ((Double(arc4random_uniform(UInt32(11))))/10.0)
            }
            preferenceList += [preference]
        }
    }
    
    func sellLemonade() {
        for customerPreference in preferenceList {
            if customerPreference < 0.4 && lemonadeRatio > 1.0 {
                funds += 1
                fundsCounter += 1
            }
            else if customerPreference >= 0.4 && customerPreference <= 0.6 && lemonadeRatio == 1 {
                funds += 1
                fundsCounter += 1
            }
            else if customerPreference > 0.6 && lemonadeRatio < 1.0 {
                funds += 1
                fundsCounter += 1
            }
        }
    }
    
    func summaryAlert() {
        var myAlertView = UIAlertView()
        
        if funds == 0 {
            showAlertWithText(header: "Game Over", message: "You made it through \(dayCounter) days.", actionMessage: "Play Again?")
            
            funds = 10
            lemonInventory = 1
            lemonInventoryLabel.text = "\(lemonInventory) Lemon"
            iceCubeInventory = 1
            iceCubeInventoryLabel.text = "\(iceCubeInventory) Ice Cube"
        }
        else {
            showAlertWithText(header: "Day \(dayCounter) Summary", message: "Made: $\(fundsCounter)\n Customers: \(preferenceList.count)", actionMessage: "Continue to Day \(dayCounter + 1)")
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
        fundsCounter = 0
        weatherEffect = 0
        
        weatherForecast()
    }
    
    @IBAction func startDayButtonPressed(sender: AnyObject) {
        mixLemonade()
        createCustomers()
        sellLemonade()
        dayCounter += 1
        summaryAlert()
        closeLemonadeStand()
    }
    
    func showAlertWithText(header: String = "Warning", message: String, actionMessage: String) {
        var alert = UIAlertController(title: header, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: actionMessage, style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
}

