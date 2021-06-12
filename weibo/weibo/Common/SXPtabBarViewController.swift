//
//  SXPtabBarViewController.swift
//  weibo
//
//  Created by shixinPeng on 16/2/24.
//  Copyright © 2016年 shixinPeng. All rights reserved.
//

import UIKit

class SXPtabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //添加控制器
        addChildViewController()
        
        
        
    }
    //重载,添加控制器
    func addChildViewController() {
        //添加控制的代码
        addChildViewController(SXPhomeViewController(), title: "首页", imageName: "tabbar_home")
        
        addChildViewController(SXPmessageViewController(), title: "消息", imageName: "tabbar_message_center")
        
        addChildViewController(SXPfindsViewController(), title: "发现", imageName: "tabbar_discover")
        
        addChildViewController(SXPsettingViewController(), title: "设置", imageName: "tabbar_profile")
        
    }
    
    

   
    //利用重载,添加四个控制器
     func addChildViewController(vc:UIViewController,title: String, imageName: String ) {
        
        //初始化一个控制器
        //let vc = SXPfindsViewController()
        
        //设置属性
        vc.title = title
        
        //设置图片
        vc.tabBarItem.image = UIImage(named: imageName)
        vc.tabBarItem.selectedImage = UIImage(named: "\(imageName)_highlighted")
        
        //设置渲染颜色
        UITabBar.appearance().tintColor = UIColor.orangeColor()
        
        //添加控制器 包装一个导航控制器
        
        addChildViewController( UINavigationController(rootViewController: vc))
        
    }
    

}
