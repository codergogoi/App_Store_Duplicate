//
//  AppDetailCell.swift
//  AppStoreDuplicate
//
//  Created by MAC01 on 08/02/18.
//  Copyright © 2018 Jayanta Gogoi. All rights reserved.
//

import UIKit

class AppDetailsCell : BaseCell{
    
    let bannerIdentifier = "bannerCell"
 
    override func setupSubViews(){
        
        addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
 
        collectionView.register(AppDetailsBannerImageCell.self, forCellWithReuseIdentifier: bannerIdentifier)
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": collectionView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": collectionView]))
 
    }
    
}

extension AppDetailsCell : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 5
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
 
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: bannerIdentifier, for: indexPath) as! AppDetailsBannerImageCell
            return cell
       
 
       
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 280, height: 190)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 5
    }

}

class AppDetailsBannerImageCell: BaseCell{
    
    let bannerImage : UIImageView = {
        
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.backgroundColor = UIColor.white
        imgView.contentMode = .scaleAspectFill
        imgView.clipsToBounds = true
        imgView.layer.masksToBounds = true
        
        return imgView
    }()
    
    override func setupSubViews() {
        super.setupSubViews()
        
        backgroundColor = UIColor.red
        
        addSubview(bannerImage)
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[v0]-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": bannerImage]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[v0]-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": bannerImage]))
        
    }
    
}









