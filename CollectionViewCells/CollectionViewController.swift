//
//  ViewController.swift
//  CollectionViewCells
//
//  Created by daniel.martinez on 26/8/15.
//  Copyright (c) 2015 info.danielmartinez. All rights reserved.
//

import UIKit

class CollectionViewController: UICollectionViewController, UISearchResultsUpdating, UISearchBarDelegate {

    @IBOutlet weak var searchbarView: UIView!
    
    var resultSearchController = UISearchController()
    var searchButton: UIBarButtonItem!
    
    private let reuseIdentifier = "cellIdentifier"
    
    var items: [String]!
    var filteredItems: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeItems()
        setupSearchBar()
    }
    
    func initializeItems() {
        items = []
        for (var i = 0; i < 40; i++) {
            items.append("Hello\(i)")
        }
        filteredItems = items
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        self.navigationItem.titleView = nil
        self.navigationItem.rightBarButtonItem = searchButton
    }
    
    func showSearch() {
        self.navigationItem.rightBarButtonItem = nil
        self.navigationItem.titleView = resultSearchController.searchBar
        resultSearchController.searchBar.becomeFirstResponder()
    }
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        
        let searchText = searchController.searchBar.text
        
        if ((searchText == nil) || (searchText == "")) {
            filteredItems = items
        } else {
            filteredItems = items.filter { $0.rangeOfString(searchText) != nil }
        }
        
        self.collectionView!.reloadData()
        
    }
    
    func setupSearchBar() {
        searchButton = UIBarButtonItem(barButtonSystemItem: .Search, target: self, action: "showSearch")
        navigationItem.rightBarButtonItem = searchButton
        self.resultSearchController = {
            let controller = UISearchController(searchResultsController: nil)
            controller.searchResultsUpdater = self
            controller.dimsBackgroundDuringPresentation = false
            controller.hidesNavigationBarDuringPresentation = false  // default true
            controller.searchBar.sizeToFit()
            return controller
            }()
        self.resultSearchController.searchBar.delegate = self
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredItems.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! CircleWithNotificationCollectionViewCell
        
        let item: String = self.filteredItems[indexPath.row]
        
        cell.imageView.layer.cornerRadius = cell.imageView.frame.size.width/2
        cell.imageView.clipsToBounds = true
        
        cell.imageView.layer.borderColor = UIColor.whiteColor().CGColor
        cell.imageView.layer.borderWidth = 5.0
        
        cell.imageView.image = UIImage(named: "ExampleImage")
        
        cell.notificationIcon.textContainerInset = UIEdgeInsetsMake(2, 2, 2, 2)
        cell.notificationIcon.text = "99999999"
        cell.notificationIcon.layer.cornerRadius = 5
        
        cell.locationName.text = item
        
        var blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
        var blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = cell.imageView.bounds
        cell.imageView.addSubview(blurEffectView)
        
        return cell
        
    }

}

