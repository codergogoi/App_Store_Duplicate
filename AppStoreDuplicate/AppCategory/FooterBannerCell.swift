//
//  FooterBannerCellView.swift
//  AppStoreDuplicate
//
//  Created by MAC01 on 29/01/18.
//  Copyright © 2018 Jayanta Gogoi. All rights reserved.
//

import UIKit

class FooterBannerCell: CategoryCell {
    
    private let footerIdentifier = "footerView"
    
    var bannerDataModel: [BannerApps]?
    
    
    override func setupView() {
       
        self.addSubview(appCollectionView)
        appCollectionView.translatesAutoresizingMaskIntoConstraints = false
        appCollectionView.backgroundColor = UIColor.white
        appCollectionView.delegate = self
        appCollectionView.dataSource = self
        appCollectionView.showsHorizontalScrollIndicator = false
        appCollectionView.alwaysBounceHorizontal = true
        
        appCollectionView.register(FooterCellView.self, forCellWithReuseIdentifier: footerIdentifier)
        
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": appCollectionView]))
        
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": appCollectionView]))
 
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if let count = bannerDataModel?.count{
            
            return count
        }
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let footerBannerCell = collectionView.dequeueReusableCell(withReuseIdentifier: footerIdentifier, for: indexPath) as! FooterCellView
        
        if let dataModel = bannerDataModel?[indexPath.row]{
            
            if let appImg = dataModel.imgFile{
                footerBannerCell.appIconImg.image = appImg
            }
        }
 
        return footerBannerCell
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 280, height: 140)
    }
    
}

class FooterCellView: AppCellView {
    
    override func setupView() {
        self.addSubview(appIconImg)
        appIconImg.layer.cornerRadius = 20
        appIconImg.clipsToBounds = true
        appIconImg.translatesAutoresizingMaskIntoConstraints = false
        
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[v0]-10-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": appIconImg]))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[v0]-10-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": appIconImg]))
        
    }
    
}
