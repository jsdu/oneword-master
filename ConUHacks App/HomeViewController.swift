//
//  HomeViewController.swift
//  OneWord
//
//  Created by Jason Du on 2016-01-23.
//  Copyright © 2016 Jason Du. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet var scrollView: UIScrollView!
    
//    @IBOutlet weak var collectionView: UICollectionView!
//    
//    var collectionViewLayout: CustomImageFlowLayout!
//    
    override func viewDidLoad() {
        super.viewDidLoad()
//        
//        collectionViewLayout = CustomImageFlowLayout()
//        collectionView.collectionViewLayout = collectionViewLayout
//        collectionView.backgroundColor = .blackColor()
//        
//        scrollView.contentSize = CGSize(width:375,  height: 1500)
    }
    
//    
//    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 6
//    }
//    
//    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! ImageCollectionViewCell
//        
//        let imageName = (indexPath.row % 2 == 0) ? "image1" : "image2"
//        
//        cell.imageView.image = UIImage(named: imageName)
//        
//        return cell
//    }
//    
//    override func prefersStatusBarHidden() -> Bool {
//        return true
//    }
}
