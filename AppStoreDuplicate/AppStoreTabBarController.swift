//
//  AppStoreTabBarController.swift
//  AppStoreDuplicate
//
//  Created by MAC01 on 30/01/18.
//  Copyright © 2018 Jayanta Gogoi. All rights reserved.
//

import UIKit

class AppStoreTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        let categoryCVC = CategoryCollectionViewController(collectionViewLayout: layout)
        let topChartCVC = TopChartsCollectionViewController(collectionViewLayout: layout)
        let exploreCVC = ExploreCollectionViewController(collectionViewLayout: layout)
        let searchCVC = SearchCollectionViewController(collectionViewLayout: layout)
        let updateCVC = UpdateCollectionViewController(collectionViewLayout: layout)
        
       viewControllers = [getGenericNavController(vc: categoryCVC, itemTitle: "Featured", itemImg: #imageLiteral(resourceName: "feature_icon"), title: "Featured Apps"), getGenericNavController(vc: topChartCVC, itemTitle: "Top Charts", itemImg: #imageLiteral(resourceName: "top_charts") , title: "Top Charts"),getGenericNavController(vc: exploreCVC, itemTitle: "Explore", itemImg: #imageLiteral(resourceName: "explore_icon") , title: "Explore"),getGenericNavController(vc: searchCVC, itemTitle: "Search", itemImg: #imageLiteral(resourceName: "search_icon") , title: "Search App"),getGenericNavController(vc: updateCVC, itemTitle: "Update", itemImg: #imageLiteral(resourceName: "updates_icon") , title: "Updates")]
        
    }
    
    
    func getGenericNavController(vc: UIViewController,itemTitle: String, itemImg: UIImage,title: String)-> UINavigationController{
        
        let navController = UINavigationController(rootViewController: vc)
        navController.tabBarItem.title = itemTitle
        navController.tabBarItem.image = itemImg
        vc.navigationItem.title = title
        
        return navController
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
