//
//  ViewController.swift
//  LikeSnapChat
//
//  Created by Fumiya Yamanaka on 2016/05/22.
//  Copyright © 2016年 fumiya yamanaka. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!

    var scrollBeginningPoint: CGPoint = CGPointMake(0, 0)
    var currentViewPosition: CGPoint = CGPointMake(0, 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        LeftView
        let leftView: LeftView = LeftView(nibName: "LeftView", bundle: nil)
        self.addChildViewController(leftView)
        leftView.didMoveToParentViewController(self)
        /* addChildViewControllerとセットで書く http://qiita.com/yimajo/items/a5e16fa0f9c332a55ccf */
        leftView.view.frame.origin = CGPointMake(0, self.view.frame.height)
        self.scrollView.addSubview(leftView.view)
        
//        RightView
        let rightView: RightView = RightView(nibName: "RightView", bundle: nil)
        self.addChildViewController(rightView)
        rightView.didMoveToParentViewController(self)
        rightView.view.frame.origin = CGPointMake(self.view.frame.width * 2, self.view.frame.height)
        self.scrollView.addSubview(rightView.view)

        //        CenterView
        let centerView: CenterView = CenterView(nibName: "CenterView", bundle: nil)
        self.addChildViewController(centerView)
        centerView.didMoveToParentViewController(self)
        centerView.view.frame.origin = CGPointMake(self.view.frame.width, self.view.frame.height)
        self.scrollView.addSubview(centerView.view)

        
//        UpView
        let upView: UpView = UpView(nibName: "UpView", bundle: nil)
        self.addChildViewController(upView)
        upView.didMoveToParentViewController(self)
        upView.view.frame.origin = CGPointMake(self.view.frame.width, 0)
        self.scrollView.addSubview(upView.view)

//        DownView
        let downView: DownView = DownView(nibName: "DownView", bundle: nil)
        self.addChildViewController(downView)
        downView.didMoveToParentViewController(self)
        downView.view.frame.origin = CGPointMake(self.view.frame.width, self.view.frame.height * 2)
        self.scrollView.addSubview(downView.view)


        self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width*3, self.view.frame.size.height*3) // scrollviewの大きさ
        self.scrollView.contentOffset = CGPointMake(self.view.frame.width, self.view.frame.height) //初期位置設定       
        currentViewPosition = scrollView.contentOffset
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        scrollBeginningPoint = scrollView.contentOffset
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let currentPoint = scrollView.contentOffset
//
        if scrollBeginningPoint.y < currentPoint.y && (currentViewPosition == CGPointMake(0, self.view.frame.height) || currentViewPosition == CGPointMake(self.view.frame.width * 2, self.view.frame.height)) {
            scrollView.contentOffset.y = self.view.frame.height
        }
        
        if scrollBeginningPoint.y > currentPoint.y && (currentViewPosition == CGPointMake(0, self.view.frame.height) || currentViewPosition == CGPointMake(self.view.frame.width * 2, self.view.frame.height)) {
            scrollView.contentOffset.y = self.view.frame.height
        }

        if scrollBeginningPoint.x < currentPoint.x && (currentViewPosition == CGPointMake(self.view.frame.width, 0) || currentViewPosition == CGPointMake(self.view.frame.width, self.view.frame.height*2))  {
            scrollView.contentOffset.x = self.view.frame.width
        }
        
        if scrollBeginningPoint.x > currentPoint.x && (currentViewPosition == CGPointMake(self.view.frame.width, 0) || currentViewPosition == CGPointMake(self.view.frame.width, self.view.frame.height*2)) {
            scrollView.contentOffset.x = self.view.frame.width
        }
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        currentViewPosition = scrollView.contentOffset
        print(currentViewPosition)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

