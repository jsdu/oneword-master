//
//  ProfileImageCollectionViewCell.swift
//  OneWord
//
//  Created by Jason Du on 2016-01-23.
//  Copyright © 2016 Jason Du. All rights reserved.
//

import UIKit

class ProfileImageCollectionViewCell: UICollectionViewCell {
    @IBOutlet var imageView: UIImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
}
