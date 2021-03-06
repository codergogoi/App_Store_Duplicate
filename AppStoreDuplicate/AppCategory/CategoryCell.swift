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
    
    var dataModel : [AppDetails]?
    
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
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.backgroundColor  = UIColor.white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
 
        return collectionView
    }()
    
    let bottomLineView : UIView = {
        
        let lineView = UIView()
        lineView.backgroundColor = UIColor.darkGray
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
       // self.backgroundColor = UIColor(white: 0.95, alpha: 1)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
 
    func setupView(){
        
        self.addSubview(categoryTitle)
        self.addSubview(bottomLineView)
        self.appCollectionView.delegate = self
        self.appCollectionView.dataSource = self
        self.appCollectionView.register(AppCellView.self, forCellWithReuseIdentifier: cellIdentifier)
        self.appCollectionView.alwaysBounceHorizontal = true
        self.appCollectionView.showsHorizontalScrollIndicator = false
        
        
        self.addSubview(appCollectionView)

        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v0]-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": categoryTitle]))
    
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[v1]-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v1": appCollectionView]))
        
         self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v2]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v2": bottomLineView]))
        
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0(20)]-14-[v1]-[v2]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": categoryTitle,"v1": appCollectionView,"v2": bottomLineView]))
 
    }
 
 
}

extension CategoryCell: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if let count = dataModel?.count{
            return count
        }
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! AppCellView
        
        if let appData = dataModel?[indexPath.row]{
            cell.dataModel = appData
        }
 
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        categoryCVC?.loadAppDetailsView()
        
    }
    
}

extension CategoryCell : UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 90, height: self.frame.height - 25)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 10, left: 2, bottom: 10, right: 2)
    }
    
}

class AppCellView: UICollectionViewCell{
    
    var dataModel : AppDetails? {
        
        didSet{
            
            if let model = dataModel{
                
                if let appIconName = model.appIconName{
                    appIconImg.image = UIImage(named: appIconName)
                }
                
                if let appName = model.appName{
                    
                    if let appCategory = model.category{
                        
                        let attrText = NSMutableAttributedString()
                        
                        let appName = NSAttributedString(string: "\(appName)\n", attributes: [NSAttributedStringKey.foregroundColor : UIColor.darkGray, NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 12)])
                        attrText.append(appName)
                        
                        let appInfo = NSAttributedString(string:appCategory, attributes: [NSAttributedStringKey.foregroundColor: UIColor.lightGray, NSAttributedStringKey.font: UIFont.systemFont(ofSize: 11)])
                        
                        attrText.append(appInfo)
                        
                        lblAppInfo.attributedText = attrText
                       
                    }
                    
                }
               
            }
           
        }
        
    }
    
    let appIconImg : UIImageView = {
       
        let img = UIImageView()
        img.contentMode = .scaleToFill
        //img.image = #imageLiteral(resourceName: "clash")
        img.translatesAutoresizingMaskIntoConstraints = false
        img.clipsToBounds = true
 
        return img
    }()
    
    let lblAppInfo : UILabel = {
       
        let lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
 
        return lbl
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
         setupView()
    }
    
    
    func setupView(){
        
        self.addSubview(appIconImg)
        //self.backgroundColor = UIColor.cyan
        appIconImg.layer.cornerRadius = 10
        appIconImg.layer.masksToBounds = true
        self.addSubview(lblAppInfo)
        
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[v0(80)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": appIconImg]))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[v0(80)]-[v1]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": appIconImg, "v1": lblAppInfo]))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[v1]-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v1": lblAppInfo]))
        
     }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
}
