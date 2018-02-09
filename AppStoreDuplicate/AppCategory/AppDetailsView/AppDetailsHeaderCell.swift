//
//  AppDetailsHeaderCell.swift
//  AppStoreDuplicate
//
//  Created by MAC01 on 08/02/18.
//  Copyright © 2018 Jayanta Gogoi. All rights reserved.
//

import UIKit


class AppDetailsHeaderCell : BaseCell{
    
    var appNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.darkGray
        label.text = "App Name: By Disney"
        return label
    }()
    
    var buyButton : UIButton = {
        let btn = UIButton()
        btn.layer.cornerRadius = 4
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Buy", for: .normal)
        btn.layer.borderColor = UIColor.blue.cgColor
        btn.setTitleColor(UIColor.blue, for: .normal)
        btn.layer.borderWidth = 1
        return btn
    }()
    
    var segmentedControl : UISegmentedControl = {
        let segment = UISegmentedControl(items: ["Details","Review","Related"])
        segment.tintColor = UIColor.darkGray
        segment.translatesAutoresizingMaskIntoConstraints = false
        //Details //Review //Related
        return segment
        
    }()
    
    var lineView: UIView  = {
        
        let line = UIView()
        line.backgroundColor = UIColor.lightGray
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
        
    }()
    
    override func setupSubViews() {
        super.setupSubViews()
        addSubview(appIcon)
        appIcon.backgroundColor = UIColor.lightGray
        addSubview(appNameLabel)
        addSubview(segmentedControl)
        addSubview(buyButton)
        addSubview(lineView)
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-14-[v0(80)]-10-[v1]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": appIcon, "v1": appNameLabel]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[v0(80)]-14-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":buyButton]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-50-[v0]-50-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":segmentedControl]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[v0]-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":lineView]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-14-[v0(80)]-30-[v1(30)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": appIcon,"v1": segmentedControl]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0(40)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": appNameLabel]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0(30)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":buyButton]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0(1)]-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": lineView]))
        
        addConstraint(NSLayoutConstraint(item: appNameLabel, attribute: .top, relatedBy: .equal, toItem: appIcon, attribute: .top, multiplier: 1, constant: 0))
        
        addConstraint(NSLayoutConstraint(item: buyButton, attribute: .centerY, relatedBy: .equal, toItem: appIcon, attribute: .centerY, multiplier: 1, constant: 0))
        
        addConstraint(NSLayoutConstraint(item: buyButton, attribute: .top, relatedBy: .equal, toItem: appIcon, attribute: .top, multiplier: 1, constant: 50))
        
    }
    
}

