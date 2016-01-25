//
//  noteWorthyViewController.swift
//  ConUHacks App
//
//  Created by Jason Du on 2016-01-24.
//  Copyright © 2016 ConUHacks. All rights reserved.
//

import UIKit

class noteWorthyViewController: UIViewController, UICollectionViewDataSource {
    @IBOutlet weak var collectionView: UICollectionView!
    
    var collectionViewLayout: CustomImageFlowLayout!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionViewLayout = CustomImageFlowLayout()
        collectionView.collectionViewLayout = collectionViewLayout
        collectionView.backgroundColor = .whiteColor()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        collectionView.reloadData()
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var row = 0
        if let tbc = tabBarController as? customData {
            row = tbc.notableArray.count
        } else {
            row = 10
        }
        return row
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! noteWorthyCollectionViewCell
        
        //let imageName = (indexPath.row % 2 == 0) ? "image1" : "image2"
        
        //cell.imageView.image = UIImage(named: imageName)
        if let tbc = tabBarController as? customData {
            cell.imageView.image = tbc.notableArray[indexPath.row]
        } else {
            cell.imageView.image = UIImage(named: "image1")
        }
        
        print ("IMAGE")
        return cell
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

}
