//
//  yesterdayViewControllerCell.swift
//  ConUHacks App
//
//  Created by Jason Du on 2016-01-24.
//  Copyright © 2016 ConUHacks. All rights reserved.
//

import UIKit

class yesterdayViewControllerCell: UICollectionViewCell {
    @IBOutlet var imageView: UIImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
}
