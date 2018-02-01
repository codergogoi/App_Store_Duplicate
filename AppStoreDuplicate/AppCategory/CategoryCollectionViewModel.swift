//
//  AppCategoryViewModel.swift
//  AppStoreDuplicate
//
//  Created by MAC01 on 25/01/18.
//  Copyright © 2018 Jayanta Gogoi. All rights reserved.
//

import UIKit

class CategoryCollectionViewModel: NSObject {
    
    var appCategoryArray : [AppcategoryStruct] = []
    
    var bannerAppArray: [BannerApps] = []
    
    var topApps: [AppDetails] = []
    var topGames: [AppDetails] = []
    
    override init() {
        
        super.init()
        //TODO : - replace with API data
        
 
        setupDate()
    }
    
    func setupDate(){
        // :TODO - replace with API
        
        bannerAppArray.append(BannerApps(imgFile: #imageLiteral(resourceName: "hb1"), appIndex: 0, appName: "App 1"))
        bannerAppArray.append(BannerApps(imgFile: #imageLiteral(resourceName: "hb4"), appIndex: 1, appName: "App 2"))
        bannerAppArray.append(BannerApps(imgFile: #imageLiteral(resourceName: "hb3"), appIndex: 2, appName: "App 3"))
        bannerAppArray.append(BannerApps(imgFile: #imageLiteral(resourceName: "hb2"), appIndex: 3, appName: "App 4"))
        bannerAppArray.append(BannerApps(imgFile: #imageLiteral(resourceName: "hb5"), appIndex: 4, appName: "App 5"))
        
        topApps.append(AppDetails(appName: "Dark Room", appIconName: "dark_room", category: "App"))
        topApps.append(AppDetails(appName: "Currency", appIconName: "currency", category: "App"))
        topApps.append(AppDetails(appName: "Transfer Wise", appIconName: "transfer_wise", category: "App"))
        topApps.append(AppDetails(appName: "Blog Lovin", appIconName: "blog_lovin", category: "App"))
        topApps.append(AppDetails(appName: "Blek", appIconName: "blek", category: "App"))
        
        topGames.append(AppDetails(appName: "Battle Heart", appIconName: "battle_heart", category: "Games"))
        topGames.append(AppDetails(appName: "Colin Mc Rae", appIconName: "colin_mcrae", category: "Games"))
        topGames.append(AppDetails(appName: "Mighty Switch", appIconName: "mighty_switch", category: "Games"))
        topGames.append(AppDetails(appName: "Tempo", appIconName: "tempo", category: "Games"))
        topGames.append(AppDetails(appName: "Goblin Sword", appIconName: "goblin_sword", category: "Games"))
        topGames.append(AppDetails(appName: "Threes!", appIconName: "threes", category: "Games"))
        
        appCategoryArray.append(AppcategoryStruct(categoryName: "Featured Apps", appsModel: topApps))
        appCategoryArray.append(AppcategoryStruct(categoryName: "Featured games", appsModel: topGames))
 
    }

}

struct BannerApps{
    
    var imgFile: UIImage?
    var appIndex: Int?
    var appName: String?
    
}


struct AppcategoryStruct{
    
    var categoryName: String?
    var appsModel: [AppDetails]?
    
}

struct AppDetails {
    
    var appName: String?
    var appIconName: String?
    var category: String?
    
}



