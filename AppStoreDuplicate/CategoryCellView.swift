//
//  CategoryCellView.swift
//  AppStoreDuplicate
//
//  Created by MAC01 on 25/01/18.
//  Copyright © 2018 Jayanta Gogoi. All rights reserved.
//

import UIKit

class CategoryCellView: UICollectionViewCell {
    
    private let cellIdentifier = "cell"
    
    var appCategoryDataModel : AppcategoryStruct? {
        
        didSet{
            if let categoryName = appCategoryDataModel?.categoryName{
                categoryTitle.text = categoryName
            }
        }
        
    }
    
    
    let categoryTitle: UILabel = {
       
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = UIColor.darkGray
        label.text = "Pick Traveller"
        return label
    }()
    
    let appCollectionView : UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.backgroundColor  = UIColor.clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
 
        return collectionView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(white: 0.95, alpha: 1)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
 
    func setupView(){
        
        self.addSubview(categoryTitle)
 
        self.appCollectionView.delegate = self
        self.appCollectionView.dataSource = self
        self.appCollectionView.register(AppCellView.self, forCellWithReuseIdentifier: cellIdentifier)
        self.appCollectionView.alwaysBounceHorizontal = true
        self.appCollectionView.showsHorizontalScrollIndicator = false
        self.addSubview(appCollectionView)

        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-14-[v0]-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": categoryTitle]))
    
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[v1]-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v1": appCollectionView]))
        
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0(20)]-14-[v1]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": categoryTitle,"v1": appCollectionView]))
 
    }
 
}

extension CategoryCellView: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! AppCellView
        
        return cell
        
    }
    
}

extension CategoryCellView : UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 150, height: self.frame.height - 25)
        
    }
    
}


class AppCellView: UICollectionViewCell{
    
    let appIconImg : UIImageView = {
       
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.image = #imageLiteral(resourceName: "clash")
        img.layer.cornerRadius = 10

        return img
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        setupView()
    }
    
    
    func setupView(){
        
        self.addSubview(appIconImg)
        self.appIconImg.translatesAutoresizingMaskIntoConstraints = false
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[v0]-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": appIconImg]))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[v0(120)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": appIconImg]))
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
}
