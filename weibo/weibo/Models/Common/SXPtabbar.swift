//
//  SXPtabbar.swift
//  weibo
//
//  Created by shixinPeng on 16/2/24.
//  Copyright © 2016年 shixinPeng. All rights reserved.
//

import UIKit

/*

自定义一个tabbar 调整里面item的位置
添加中间的button,添加点击事件
完成tabbar 的设置

*/
class SXPtabbar: UITabBar {

    /*
    自定义三部曲:
    一:重写init
    二:设置私有方法,添加视图和设置约束
    三:懒加载
    */
    
    //第一步:重写init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //添加按钮
        setUpUi()
    }

    //系统添加的方法,防止你不知道从xib加载视图
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //第二步:设置私有方法,添加视图和设置约束
    private func setUpUi() {
        
        addSubview(composeButton)
    }

    //第三步:懒加载
    //添加到中间的button
    lazy var composeButton: UIButton = {
        
        //初始化
        let btn:UIButton = UIButton(type: UIButtonType.Custom)
        
        //设置属性
        btn.setBackgroundImage(UIImage(named:"tabbar_compose_button"), forState: UIControlState.Normal)
        
        btn.setBackgroundImage(UIImage(named:"tabbar_compose_button_highlighted"), forState: UIControlState.Selected)
         //图片
            btn.setImage(UIImage(named: "tabbar_compose_icon_add"), forState: UIControlState.Normal)
            btn.setImage(UIImage(named: "tabbar_compose_icon_add_highlighted"), forState: UIControlState.Highlighted)
        
        btn.sizeToFit()
    
       return btn
    }()
    
    override func layoutSubviews() {
        
        //遍历tabbar获取 其中的item 设置其尺寸,空出来中间的位置
        super.layoutSubviews()
        
        //print(subviews)
        /*
        [<_UITabBarBackgroundView: 0x7ff13a51e420; frame = (0 0; 414 49); autoresize = W; userInteractionEnabled = NO; layer = <CALayer: 0x7ff13a50e030>>, 
        <UITabBarButton: 0x7ff13a4c3990; frame = (2 1; 100 48); opaque = NO; layer = <CALayer: 0x7ff13a578d40>>, 
        <UITabBarButton: 0x7ff13a7f4100; frame = (106 1; 99 48); opaque = NO; layer = <CALayer: 0x7ff13a58f0b0>>, 
        <UITabBarButton: 0x7ff13a647530; frame = (209 1; 100 48); opaque = NO; layer = <CALayer: 0x7ff13a4c4a30>>, 
        <UITabBarButton: 0x7ff13a7f73d0; frame = (313 1; 99 48); opaque = NO; layer = <CALayer: 0x7ff13a7f7930>>,
        <UIImageView: 0x7ff13a58fb20; frame = (0 -0.333333; 414 0.333333); autoresize = W; userInteractionEnabled = NO; layer = <CALayer: 0x7ff13a50a180>>]
        */
        //print("_____________________________________")
        
        var index:CGFloat = 0
        
        let width = bounds.width/5
        let heigth = bounds.height
        
        //进行获取barButton
        for subView in subviews{
            //判断是否是UITabBarButton,如果是UITabBarButton 则取出
            if  subView.isKindOfClass(NSClassFromString("UITabBarButton")!) {
                
                //修改frame
                subView.frame = CGRect(x: CGFloat(index++) * width, y: 0 , width: width, height: heigth)
                
                //让出中间的位置
                if index == 2 {index++}
            }
        }
        
        
        //设置中间按钮的属性
        composeButton.frame = CGRectMake(2 * width, 0, width, heigth)
        
    }
    
}
