//
//  ViewController.swift
//  CollectionViewCells
//
//  Created by daniel.martinez on 26/8/15.
//  Copyright (c) 2015 info.danielmartinez. All rights reserved.
//

import UIKit

class CollectionViewController: UICollectionViewController {

    private let reuseIdentifier = "cellIdentifier"
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 40
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! CircleWithNotificationCollectionViewCell
        
        cell.imageView.layer.cornerRadius = cell.imageView.frame.size.width/2
        cell.imageView.clipsToBounds = true
        
        cell.imageView.layer.borderColor = UIColor.whiteColor().CGColor
        cell.imageView.layer.borderWidth = 5.0
        
        cell.imageView.image = UIImage(named: "ExampleImage")
        
        cell.notificationIcon.textContainerInset = UIEdgeInsetsMake(2, 2, 2, 2)
        cell.notificationIcon.text = "99999999"
        cell.notificationIcon.layer.cornerRadius = 5
        
        cell.locationName.text = "Johannesburg"
        
        var blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
        var blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = cell.imageView.bounds
        cell.imageView.addSubview(blurEffectView)
        
        return cell
        
    }

}

