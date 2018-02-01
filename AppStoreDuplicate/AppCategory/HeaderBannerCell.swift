//
//  HeaderBannerCellView.swift
//  AppStoreDuplicate
//
//  Created by MAC01 on 29/01/18.
//  Copyright © 2018 Jayanta Gogoi. All rights reserved.
//

import UIKit
 
class HeaderBannerCell: CategoryCell {
    
    private let bannerIdentifier : String = "bannerApp"
    
    var bannerDataModel: [BannerApps]?
 
    override func setupView() {
        
        addSubview(appCollectionView)
        appCollectionView.delegate = self
        appCollectionView.dataSource = self
        appCollectionView.register(BannerCellView.self, forCellWithReuseIdentifier: bannerIdentifier)
        appCollectionView.alwaysBounceHorizontal = true
        appCollectionView.showsHorizontalScrollIndicator = false
        
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": appCollectionView]))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]-5-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": appCollectionView]))
        
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if let count = bannerDataModel?.count{
            return count
        }
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let bannerCell = collectionView.dequeueReusableCell(withReuseIdentifier: bannerIdentifier, for: indexPath) as! BannerCellView
        
        if let dataModel = bannerDataModel?[indexPath.row]{
            
            if let appImg = dataModel.imgFile{
                bannerCell.appIconImg.image = appImg
            }
        }
        
        return bannerCell
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 260, height: 120)
        
    }
    
 
}


class BannerCellView: AppCellView{
    
 
    override func setupView() {
        addSubview(appIconImg)
        appIconImg.layer.cornerRadius = 0
        appIconImg.contentMode = .scaleAspectFit
 
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[v0]-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": appIconImg]))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": appIconImg]))
 
        
    }
    
    
}

