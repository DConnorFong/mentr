//
//  SecondViewController.swift
//  mentr
//
//  Created by Wren Liang on 2019-11-30.
//  Copyright © 2019 Wren Liang. All rights reserved.
//

import UIKit

class SwipeViewController: UIViewController {
    var personDataArray: [Person]?
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
    
    /*
    func setupStackView() {
        stackView!.translatesAutoresizingMaskIntoConstraints = false
        stackView!.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView!.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -60).isActive = true
        stackView!.widthAnchor.constraint(equalToConstant: 300).isActive = true
        stackView!.heightAnchor.constraint(equalToConstant: 400).isActive = true
    }
    */
    


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
        return 0 //change to return personDataArray.count
    }
    
    func cardAt(index: Int) -> CardView {
        let card = CardView()
        card.personData = personDataArray![index]
        return card
    }
    
    func emptyView() -> UIView? {
        return nil
    }
    
    
}
