//
//  SecondViewController.swift
//  mentr
//
//  Created by Wren Liang on 2019-11-30.
//  Copyright © 2019 Wren Liang. All rights reserved.
//

import UIKit

class SwipeViewController: UIViewController {
    var personDataArray: [Person] = [
        Person(id: "1", name: "Wren", animoji: UIImage(named: "head-1")!, major: majors.cpen, university: "UBC", skills: ["A", "B", "C"], bio: "Hello", facebook: "wrenl", email: "wrenl@x.com", phoneNum: "123123", wechat: "wechat", linkedin: "linkedin"),
        Person(id: "2", name: "Alan", animoji: UIImage(named: "head-1")!, major: majors.cpen, university: "UBC", skills: ["A", "B", "C"], bio: "Hello", facebook: "wrenl", email: "wrenl@x.com", phoneNum: "123123", wechat: "wechat", linkedin: "linkedin"),
        Person(id: "3", name: "Stephanie", animoji: UIImage(named: "head-1")!, major: majors.cpen, university: "UBC", skills: ["A", "B", "C"], bio: "Hello", facebook: "wrenl", email: "wrenl@x.com", phoneNum: "123123", wechat: "wechat", linkedin: "linkedin")]
    var myView: SwipeView!
    
    override func loadView() {
        let newView = SwipeView()
        myView = newView
        
        myView.stackView.swipeDataSource = self
        
        self.view = myView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    

}

//---Data Source Protocol for SwipeViewController---//
protocol SwipeCardDataSource {
    func numberOfCardsToShow() -> Int
    func cardAt(index: Int) -> CardView
    func emptyView() -> UIView?
}
//---Protocol End---///


extension SwipeViewController: SwipeCardDataSource {
    func numberOfCardsToShow() -> Int {
        return personDataArray.count
    }
    
    func cardAt(index: Int) -> CardView {
        let card = CardView()
        card.personData = personDataArray[index]
        return card
    }
    
    func emptyView() -> UIView? {
        return nil
    }
    
    
}
