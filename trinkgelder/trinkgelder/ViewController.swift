//
//  ViewController.swift
//  trinkgelder
//
//  Created by Yang Yang on 9/11/16.
//  Copyright © 2016 Yang Yang. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipValue: UILabel!
    @IBOutlet weak var totalValue: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    var locationManager = CLLocationManager()
    var tipName = "Tips"
    var tipPercentages = [0.18, 0.2, 0.25]
    var currency = "$"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        billField.becomeFirstResponder()
        
        let logo = UIImage(named: "Logo")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView
        
        locationManager.delegate = self;
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        self.billField.placeholder = "\(self.currency)0.00"
        self.tipValue.text = "\(self.currency)0.00"
        self.totalValue.text = "\(self.currency)0.00"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location:CLLocation = locations[0] as CLLocation

        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location, completionHandler: { (placemarks, e) -> Void in
            if e != nil {
                print("Error:  \(e!.localizedDescription)")
            } else {
                let placemark = placemarks![0] as CLPlacemark
                var locationText = ""
                
                if let countryCode = placemark.isoCountryCode {
                    switch countryCode {
                    case "FR":
                        self.currency = "€"
                        self.tipName = "Service compris"
                        self.tipPercentages = [0, 0.05, 0.10]
                    case "GB":
                        self.currency = "£"
                        self.tipName = "Service charge"
                        self.tipPercentages = [0.075, 0.10, 0.125]
                    case "ZA":
                        self.currency = "R"
                        self.tipName = "Service charge"
                        self.tipPercentages = [0.05, 0.10, 0.15]
                    case "RU":
                        self.currency = "₽"
                        self.tipName = "чаевые"
                        self.tipPercentages = [0.05, 0.10, 0.15]
                    case "BR":
                        self.currency = "R$"
                        self.tipName = "Gorjeta"
                        self.tipPercentages = [0.05, 0.10, 0.15]
                    case "IN":
                        self.currency = "₹"
                        self.tipName = "बख्शीस"
                        self.tipPercentages = [0.03, 0.05, 0.07]
                    case "HK":
                        self.currency = "HK$"
                        self.tipName = "小费"
                        self.tipPercentages = [0, 0, 0]
                    case "CN":
                        self.currency = "¥"
                        self.tipName = "小费"
                        self.tipPercentages = [0, 0, 0]
                    case "JP":
                        self.currency = "円"
                        self.tipName = "心付け"
                        self.tipPercentages = [0, 0, 0]
                    case "AU":
                        self.currency = "$"
                        self.tipName = "Gratuity"
                        self.tipPercentages = [0, 0, 0]
                    case "US":
                        self.currency = "$"
                        self.tipName = "Tips"
                        self.tipPercentages = [0.10, 0.15, 0.20]
                    case "MX":
                        self.currency = "$"
                        self.tipName = "Propinas"
                        self.tipPercentages = [0.08, 0.115, 0.15]
                    default:
                        self.currency = "$"
                        self.tipName = "Tips"
                        self.tipPercentages = [0.18, 0.2, 0.25]
                    }
                }
                if let locality = placemark.locality {
                    locationText += "\(locality)"
                }
                if let administrativeArea = placemark.administrativeArea {
                    locationText += ", \(administrativeArea)"
                }
                if let country = placemark.country {
                    locationText += ", \(country)"
                }
                
                self.billField.placeholder = "\(self.currency)0.00"
                self.locationLabel.text = self.tipName + "💰 \(locationText)"
            }
        })
    }
    
    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
        
        self.billField.placeholder = "\(self.currency)0.00"
        
        UIView.animate(withDuration: 0.4, delay: 0.2, options: [], animations: {
            self.tipLabel.alpha = 0
            self.tipValue.alpha = 0
            
            self.tipLabel.frame.origin.y = self.tipLabel.frame.origin.y + 40
            self.tipValue.frame.origin.y = self.tipValue.frame.origin.y + 40
        }, completion: nil)

        UIView.animate(withDuration: 0.4, animations: {
            self.totalLabel.alpha = 0
            self.totalValue.alpha = 0
            
            self.totalLabel.frame.origin.y = self.totalLabel.frame.origin.y + 40
            self.totalValue.frame.origin.y = self.totalValue.frame.origin.y + 40
        })
    }
    @IBAction func calculateTip(_ sender: AnyObject) {
        
        self.tipValue.text = "\(self.currency)0.00"
        self.totalValue.text = "\(self.currency)0.00"

        let bill = Double(billField.text!) ?? 0
        let tip = bill * self.tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        if self.tipPercentages == [0, 0, 0] {
            tipValue.text = "None!"
        } else {
            tipValue.text = String(format: "%@%.2f", self.currency, tip)
            totalValue.text = String(format: "%@%.2f", self.currency, total)
        }
    }
    
    @IBAction func animateValues(_ sender: AnyObject) {
        
        UIView.animate(withDuration: 0.4, animations: {
            self.tipLabel.alpha = 1
            self.tipValue.alpha = 1
            
            self.tipLabel.frame.origin.y = self.tipLabel.frame.origin.y - 40
            self.tipValue.frame.origin.y = self.tipValue.frame.origin.y - 40
        })
        
        UIView.animate(withDuration: 0.4, delay: 0.2, options: [], animations: {
            
            self.totalLabel.alpha = 1
            self.totalValue.alpha = 1
            
            self.totalLabel.frame.origin.y = self.totalLabel.frame.origin.y - 40
            self.totalValue.frame.origin.y = self.totalValue.frame.origin.y - 40
        }, completion: nil)
    }

}

