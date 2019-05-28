//
//  Item5.swift
//  Weather
//
//  Created by Lukas on 5/27/19.
//  Copyright © 2019 simple. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class Item5: UIViewController {

    @IBOutlet weak var Icon: UIImageView!
    @IBOutlet weak var miniDesc: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let RequestURL = "https://forecast.weather.gov/MapClick.php?lat=45.533&lon=-122.6137&unit=0&lg=english&FcstType=json"
        Alamofire.request(RequestURL).responseJSON { response in
            if let json = response.result.value {
                let JSONdecoded = JSON(json)
                let testDayType = JSONdecoded["time"]["startPeriodName"][0].stringValue
                let Temps = JSONdecoded["data"]["temperature"]
                if !testDayType.contains("night") {
                    let temps = "Temp: " + Temps[10].stringValue + "/" + Temps[11].stringValue + "\n"
                    let day = JSONdecoded["time"]["startPeriodName"][10].stringValue + "\n"
                    let desc = JSONdecoded["data"]["text"][10].stringValue
                    self.miniDesc.text = day + temps + desc
                    
                    let imageUrlString = JSONdecoded["data"]["iconLink"][10].stringValue
                    let httpsed = imageUrlString.replacingOccurrences(of: "http://", with: "https://")
                    let imageUrl = URL(string: httpsed)!
                    let imageData = try! Data(contentsOf: imageUrl)
                    let image = UIImage(data: imageData)
                    self.Icon.image = image
                }
                if testDayType.contains("night") {
                    let temps = "Temp: " + Temps[9].stringValue + "/" + Temps[10].stringValue + "\n"
                    let day = JSONdecoded["time"]["startPeriodName"][9].stringValue + "\n"
                    let desc = JSONdecoded["data"]["text"][9].stringValue
                    self.miniDesc.text = day + temps + desc
                    
                    let imageUrlString = JSONdecoded["data"]["iconLink"][9].stringValue
                    let httpsed = imageUrlString.replacingOccurrences(of: "http://", with: "https://")
                    let imageUrl = URL(string: httpsed)!
                    let imageData = try! Data(contentsOf: imageUrl)
                    let image = UIImage(data: imageData)
                    self.Icon.image = image
                }
            }
        }
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
