//
//  SecondViewController.swift
//  mentr
//
//  Created by Wren Liang on 2019-11-30.
//  Copyright © 2019 Wren Liang. All rights reserved.
//

import UIKit


protocol SwipeCardDataSource {
    func numberOfCardsToShow() -> Int
    func cardAt(index: Int) -> CardView
    func emptyView() -> UIView?
}

class SwipeViewController: UIViewController {
    var cardDataModels: [Person]?
    
    var stackWrapper: StackWrapperView?
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

//extension SwipeViewController: SwipeCardDataSource {
////    func numberOfCardsToShow() -> Int {
////        <#code#>
////    }
////
////    func cardAt(index: Int) -> CardView {
////        <#code#>
////    }
////
////    func emptyView() -> UIView? {
////        <#code#>
////    }
//    
//    
//}
