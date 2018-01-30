//
//  CategoryCellView.swift
//  AppStoreDuplicate
//
//  Created by MAC01 on 25/01/18.
//  Copyright © 2018 Jayanta Gogoi. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    
    private let cellIdentifier = "cell"
    
    var categoryCVC : CategoryCollectionViewController?
    
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

extension CategoryCell: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! AppCellView
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        categoryCVC?.loadAppDetailsView()
        
    }
    
}

extension CategoryCell : UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 150, height: self.frame.height - 25)
        
    }
    
}

class AppCellView: UICollectionViewCell{
    
    let appIconImg : UIImageView = {
       
        let img = UIImageView()
        img.contentMode = .scaleToFill
        //img.image = #imageLiteral(resourceName: "clash")
        img.translatesAutoresizingMaskIntoConstraints = false
 
        return img
    }()
    
    let lblAppInfo : UILabel = {
       
        let lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        
        let attrText = NSMutableAttributedString()
        
        let appName = NSAttributedString(string: "Clash Of Clans\n", attributes: [NSAttributedStringKey.foregroundColor : UIColor.black, NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 14)])
        attrText.append(appName)

        let appInfo = NSAttributedString(string:"Games", attributes: [NSAttributedStringKey.foregroundColor: UIColor.darkGray, NSAttributedStringKey.font: UIFont.systemFont(ofSize: 12)])
        
        attrText.append(appInfo)
        
        lbl.attributedText = attrText
        
        return lbl
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
         setupView()
    }
    
    
    func setupView(){
        
        self.addSubview(appIconImg)
        appIconImg.layer.cornerRadius = 30
        appIconImg.layer.masksToBounds = true
        self.addSubview(lblAppInfo)
        
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[v0(120)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": appIconImg]))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[v0(120)]-[v1]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": appIconImg, "v1": lblAppInfo]))
        
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[v1]-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v1": lblAppInfo]))
        
     }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
}
