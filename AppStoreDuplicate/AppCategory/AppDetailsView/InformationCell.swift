//
//  InformationCell.swift
//  AppStoreDuplicate
//
//  Created by MAC01 on 15/02/18.
//  Copyright © 2018 Jayanta Gogoi. All rights reserved.
//

import UIKit

class InformationCell: BaseCell {
    
    
    var infoDetails: [(String, String)] = [("Seller","Disney Publishing Worldwide."),("Category","Entertainment"),("Updated","Jan 2, 2018"),("Version","1.0"),("Size","120 MB"),("Rating","Ages 4+ "),("Family Sharing","Yes")]
    
    let identifier = "infoDetailsCell"
    
    let lblHeadlineText: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 18)
        lbl.textColor = UIColor.darkGray
        lbl.text = "Informations"
        return lbl
    }()
    
    override func setupSubViews() {
        super.setupSubViews()
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        self.collectionView.setCollectionViewLayout(layout, animated: true)
        self.collectionView.backgroundColor = UIColor.clear
        self.addSubview(lblHeadlineText)
        self.addSubview(collectionView)
        self.collectionView.register(MoreInfoCell.self, forCellWithReuseIdentifier: identifier)
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": lblHeadlineText]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": collectionView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[v0(12)]-20-[v1]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": lblHeadlineText,"v1": collectionView]))
        
    }
    
    
}

extension InformationCell : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! MoreInfoCell
        
        let dataModel = self.infoDetails[indexPath.row]
        cell.cellDataModel = dataModel
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: self.frame.width, height: 12)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    
}

class MoreInfoCell: BaseCell {
    
    var cellDataModel : (title: String, desc: String)?{
        
        didSet{
            if let dataModel = cellDataModel{
                lblTitle.text = dataModel.title
                lblInformation.text = dataModel.desc
             }
        }
    }
    
    let lblTitle: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = UIColor.lightGray
        lbl.textAlignment = .right
        lbl.font = UIFont.systemFont(ofSize: 12)
         return lbl
    }()
    
    let lblInformation: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = UIColor.black
        lbl.font = UIFont.systemFont(ofSize: 12)
        lbl.textAlignment = .left
         return lbl
    }()
    
    override func setupSubViews() {
        
        self.addSubview(lblTitle)
        self.addSubview(lblInformation)
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[v0(120)]-20-[v1]-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":lblTitle,"v1": lblInformation]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":lblTitle]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":lblInformation]))
 
    }
    
}

