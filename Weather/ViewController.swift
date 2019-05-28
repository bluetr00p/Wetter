//
//  ViewController.swift
//  Weather
//
//  Created by Lukas on 5/26/19.
//  Copyright © 2019 simple. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    @IBOutlet weak var LocationTitle: UILabel!
    @IBOutlet weak var CurrentTempLabel: UILabel!
    @IBOutlet weak var detailedDesc: UITextView!
    @IBOutlet weak var shortDesc: UILabel!
    
    //forcast cards
    @IBOutlet weak var Label0: UILabel!
    @IBOutlet weak var Image0: UIImageView!
    @IBOutlet weak var Label1: UILabel!
    @IBOutlet weak var Image1: UIImageView!
    @IBOutlet weak var Label2: UILabel!
    @IBOutlet weak var Image2: UIImageView!
    @IBOutlet weak var Label3: UILabel!
    @IBOutlet weak var Image3: UIImageView!
    @IBOutlet weak var Label4: UILabel!
    @IBOutlet weak var Image4: UIImageView!
    @IBOutlet weak var Label5: UILabel!
    @IBOutlet weak var Image5: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let RequestURL = "https://forecast.weather.gov/MapClick.php?lat=45.533&lon=-122.6137&unit=0&lg=english&FcstType=json"
        Alamofire.request(RequestURL).responseJSON { response in
            if let json = response.result.value {
                let JSONdecoded = JSON(json)
                let userLocation = JSONdecoded["productionCenter"].stringValue
                self.LocationTitle.text = userLocation
                let currentTemp = JSONdecoded["currentobservation"]["Temp"].stringValue
                self.CurrentTempLabel.text = "  " + currentTemp + "°"
                let descripton = JSONdecoded["data"]["text"][0].stringValue
                self.detailedDesc.text = descripton
                let shortDesction = JSONdecoded["currentobservation"]["Weather"].stringValue
                self.shortDesc.text = shortDesction.uppercased()
                
                let testDayType = JSONdecoded["time"]["startPeriodName"][0].stringValue
                let Temps = JSONdecoded["data"]["temperature"]
                if testDayType.contains("night") {
                    self.Label0.text = "Temp: \n" + Temps[1].stringValue + "/" + Temps[2].stringValue
                    self.Label1.text = "Temp: \n" + Temps[3].stringValue + "/" + Temps[4].stringValue
                    self.Label2.text = "Temp: \n" + Temps[5].stringValue + "/" + Temps[6].stringValue
                    self.Label3.text = "Temp: \n" + Temps[7].stringValue + "/" + Temps[8].stringValue
                    self.Label4.text = "Temp: \n" + Temps[9].stringValue + "/" + Temps[10].stringValue
                    self.Label5.text = "Temp: \n" + Temps[11].stringValue + "/" + Temps[12].stringValue
                    //SET IMAGES
                    
                    var imageUrlString = JSONdecoded["data"]["iconLink"][1].stringValue
                    var httpsed = imageUrlString.replacingOccurrences(of: "http://", with: "https://")
                    var imageUrl = URL(string: httpsed)!
                    var imageData = try! Data(contentsOf: imageUrl)
                    var image = UIImage(data: imageData)
                    self.Image0.image = image
                    
                    imageUrlString = JSONdecoded["data"]["iconLink"][3].stringValue
                    httpsed = imageUrlString.replacingOccurrences(of: "http://", with: "https://")
                    imageUrl = URL(string: httpsed)!
                    imageData = try! Data(contentsOf: imageUrl)
                    image = UIImage(data: imageData)
                    self.Image1.image = image
                    
                    imageUrlString = JSONdecoded["data"]["iconLink"][5].stringValue
                    httpsed = imageUrlString.replacingOccurrences(of: "http://", with: "https://")
                    imageUrl = URL(string: httpsed)!
                    imageData = try! Data(contentsOf: imageUrl)
                    image = UIImage(data: imageData)
                    self.Image2.image = image
                    
                    imageUrlString = JSONdecoded["data"]["iconLink"][7].stringValue
                    httpsed = imageUrlString.replacingOccurrences(of: "http://", with: "https://")
                    imageUrl = URL(string: httpsed)!
                    imageData = try! Data(contentsOf: imageUrl)
                    image = UIImage(data: imageData)
                    self.Image3.image = image
                    
                    imageUrlString = JSONdecoded["data"]["iconLink"][9].stringValue
                    httpsed = imageUrlString.replacingOccurrences(of: "http://", with: "https://")
                    imageUrl = URL(string: httpsed)!
                    imageData = try! Data(contentsOf: imageUrl)
                    image = UIImage(data: imageData)
                    self.Image4.image = image
                    
                    imageUrlString = JSONdecoded["data"]["iconLink"][11].stringValue
                    httpsed = imageUrlString.replacingOccurrences(of: "http://", with: "https://")
                    imageUrl = URL(string: httpsed)!
                    imageData = try! Data(contentsOf: imageUrl)
                    image = UIImage(data: imageData)
                    self.Image5.image = image
                }
                if !testDayType.contains("night") {
                    self.Label0.text = "Temp: \n" + Temps[0].stringValue + "/" + Temps[1].stringValue
                    self.Label1.text = "Temp: \n" + Temps[2].stringValue + "/" + Temps[2].stringValue
                    self.Label2.text = "Temp: \n" + Temps[4].stringValue + "/" + Temps[3].stringValue
                    self.Label3.text = "Temp: \n" + Temps[6].stringValue + "/" + Temps[5].stringValue
                    self.Label4.text = "Temp: \n" + Temps[8].stringValue + "/" + Temps[7].stringValue
                    self.Label5.text = "Temp: \n" + Temps[10].stringValue + "/" + Temps[11].stringValue

                    //SET IMAGES
                    
                    var imageUrlString = JSONdecoded["data"]["iconLink"][2].stringValue
                    var httpsed = imageUrlString.replacingOccurrences(of: "http://", with: "https://")
                    var imageUrl = URL(string: httpsed)!
                    var imageData = try! Data(contentsOf: imageUrl)
                    var image = UIImage(data: imageData)
                    self.Image0.image = image
                    
                    imageUrlString = JSONdecoded["data"]["iconLink"][4].stringValue
                    httpsed = imageUrlString.replacingOccurrences(of: "http://", with: "https://")
                    imageUrl = URL(string: httpsed)!
                    imageData = try! Data(contentsOf: imageUrl)
                    image = UIImage(data: imageData)
                    self.Image1.image = image
                    
                    imageUrlString = JSONdecoded["data"]["iconLink"][6].stringValue
                    httpsed = imageUrlString.replacingOccurrences(of: "http://", with: "https://")
                    imageUrl = URL(string: httpsed)!
                    imageData = try! Data(contentsOf: imageUrl)
                    image = UIImage(data: imageData)
                    self.Image2.image = image
                    
                    imageUrlString = JSONdecoded["data"]["iconLink"][8].stringValue
                    httpsed = imageUrlString.replacingOccurrences(of: "http://", with: "https://")
                    imageUrl = URL(string: httpsed)!
                    imageData = try! Data(contentsOf: imageUrl)
                    image = UIImage(data: imageData)
                    self.Image3.image = image
                    
                    imageUrlString = JSONdecoded["data"]["iconLink"][10].stringValue
                    httpsed = imageUrlString.replacingOccurrences(of: "http://", with: "https://")
                    imageUrl = URL(string: httpsed)!
                    imageData = try! Data(contentsOf: imageUrl)
                    image = UIImage(data: imageData)
                    self.Image4.image = image
                    
                    imageUrlString = JSONdecoded["data"]["iconLink"][12].stringValue
                    httpsed = imageUrlString.replacingOccurrences(of: "http://", with: "https://")
                    imageUrl = URL(string: httpsed)!
                    imageData = try! Data(contentsOf: imageUrl)
                    image = UIImage(data: imageData)
                    self.Image5.image = image
                }
                
            }
        }
        
    }


}

