//
//  customData.swift
//  OneWord
//
//  Created by Jason Du on 2016-01-24.
//  Copyright © 2016 Jason Du. All rights reserved.
//

import UIKit

class customData: UITabBarController {
    var imageArray:[UIImage] = []
    var peopleArray:[UIImage] = []
    var yesterdayArray:[UIImage] = []
    var notableArray: [UIImage] = []
    var results:String = ""
    
    
    override func viewDidLoad() {
        peopleArray.append(UIImage(named: "person1")!)
        peopleArray.append(UIImage(named: "person2")!)
        peopleArray.append(UIImage(named: "person3")!)
        peopleArray.append(UIImage(named: "person4")!)
        peopleArray.append(UIImage(named: "person5")!)
        peopleArray.append(UIImage(named: "person6")!)
        peopleArray.append(UIImage(named: "person7")!)
        peopleArray.append(UIImage(named: "person8")!)
        peopleArray.append(UIImage(named: "person9")!)
        peopleArray.append(UIImage(named: "person10")!)
        peopleArray.append(UIImage(named: "person11")!)
        peopleArray.append(UIImage(named: "person12")!)
        peopleArray.append(UIImage(named: "person13")!)
        
        yesterdayArray.append(UIImage(named: "building1")!)
        yesterdayArray.append(UIImage(named: "building2")!)
        yesterdayArray.append(UIImage(named: "building3")!)
        yesterdayArray.append(UIImage(named: "building4")!)
        yesterdayArray.append(UIImage(named: "building5")!)
        yesterdayArray.append(UIImage(named: "building6")!)
        yesterdayArray.append(UIImage(named: "building7")!)
        yesterdayArray.append(UIImage(named: "building8")!)
        yesterdayArray.append(UIImage(named: "building9")!)
        yesterdayArray.append(UIImage(named: "building10")!)
        yesterdayArray.append(UIImage(named: "building11")!)
        yesterdayArray.append(UIImage(named: "building12")!)
        yesterdayArray.append(UIImage(named: "building13")!)
        
        notableArray.append(UIImage(named: "notable1")!)
        notableArray.append(UIImage(named: "notable2")!)
        notableArray.append(UIImage(named: "notable3")!)
        notableArray.append(UIImage(named: "notable4")!)
        notableArray.append(UIImage(named: "notable5")!)
        notableArray.append(UIImage(named: "notable6")!)
        notableArray.append(UIImage(named: "notable7")!)
        notableArray.append(UIImage(named: "notable8")!)
        notableArray.append(UIImage(named: "notable9")!)
        notableArray.append(UIImage(named: "notable10")!)
        notableArray.append(UIImage(named: "notable11")!)
        notableArray.append(UIImage(named: "notable12")!)
        notableArray.append(UIImage(named: "notable13")!)
        
    }
}

