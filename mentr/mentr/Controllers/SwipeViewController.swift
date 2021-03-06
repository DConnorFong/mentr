//
//  SecondViewController.swift
//  mentr
//
//  Created by Wren Liang on 2019-11-30.
//  Copyright © 2019 Wren Liang. All rights reserved.
//

import UIKit

var globalArray: People = []

var addedPeople: People = [] 

class SwipeViewController: UIViewController {
    var personDataArray: [Person] = [
        Person(id: "1", name: "Wren Liang", animoji: UIImage(named: "head-1")!, major: majors.cpen, faculty: "Engineering", university: "UBC", skills: ["A", "B", "C"], bio: "Hello my name is Wren. I love to program in Swift and play basketball!", facebook: "wrenl", email: "wrenl@x.com", phoneNum: "123123", wechat: "wechat", linkedin: "linkedin"),
        Person(id: "2", name: "Alan", animoji: UIImage(named: "email")!, major: majors.cpen, faculty: "Engineering", university: "UBC", skills: ["A", "B", "C"], bio: "Hello", facebook: "wrenl", email: "wrenl@x.com", phoneNum: "123123", wechat: "wechat", linkedin: "linkedin"),
        Person(id: "3", name: "Stephanie", animoji: UIImage(named: "wechat")!, major: majors.cpen, faculty: "Engineering", university: "UBC", skills: ["A", "B", "C"], bio: "Hello", facebook: "wrenl", email: "wrenl@x.com", phoneNum: "123123", wechat: "wechat", linkedin: "linkedin"),
        Person(id: "1", name: "Connor", animoji: UIImage(named: "head-1")!, major: majors.cpen, faculty: "Engineering", university: "UBC", skills: ["A", "B", "C"], bio: "Hello", facebook: "wrenl", email: "wrenl@x.com", phoneNum: "123123", wechat: "wechat", linkedin: "linkedin")]
    
    var serverDataArray: People? {
        didSet {
            myView.stackView.swipeDataSource = self
            myView.stackView.modalDelegate = self
        }
    }
    var myView: SwipeView!
    
    
    override func loadView() {
        let newView = SwipeView()
        myView = newView
        
        
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
        return serverDataArray!.count
    }
    
    func cardAt(index: Int) -> CardView {
        let card = CardView()
        card.dataSource = serverDataArray![index]
        return card
    }
    
    func emptyView() -> UIView? {
        return nil
    }
    
    
}

protocol ServerUpdateDataDelegate {
    func updateData()
}


extension SwipeViewController: ServerUpdateDataDelegate {
    func updateData() {
        print("hello")
        self.serverDataArray = globalArray
    }
}


protocol ModalDelegate {
    func sendPerson(person: ServerPerson)
}

extension SwipeViewController: ModalDelegate {
    func sendPerson(person: ServerPerson) {
        print("sending person")
        let modalView = ModalPopUpViewController()
        modalView.selectedPerson = person
        
        self.present(modalView, animated: true)
    }
}
