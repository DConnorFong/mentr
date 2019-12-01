//
//  DetailMentorViewController.swift
//  mentr
//
//  Created by Wren Liang on 2019-11-30.
//  Copyright © 2019 Wren Liang. All rights reserved.
//

import UIKit

class DetailMentorViewController: UIViewController {
    var mentor: ServerPerson?
    var color: UIColor?
    override func viewDidLoad() {
        super.viewDidLoad()
        let newView = DetailMentorView()
        newView.backgroundColor = color
        
        let number = mentor!.id % 10 + 1
        newView.personImage.image = UIImage(named: "mentr\(number)")
        newView.nameLabel.text = "\(mentor!.firstName) \(mentor!.lastName)"
        newView.facultyLabel.text =  mentor!.faculty.rawValue
        newView.schoolLabel.text = mentor!.university.rawValue
        newView.skillLabel1.text = mentor!.interests[0]
        newView.skillLabel2.text = mentor!.interests[1]
        newView.skillLabel3.text = mentor!.interests[2]
        newView.facebookButton.addTarget(self, action: #selector(clickedFacebook), for: .touchUpInside)
        self.view = newView
        
    }
    
    @objc func clickedFacebook() {
        if let url = URL(string: "http://\(mentor!.facebook)") {
            UIApplication.shared.open(url)
        }
    }
    @objc func email() {
        if let url = URL(string: "http://\(mentor!.email)") {
            UIApplication.shared.open(url)
        }
    }
    @objc func phone() {
        if let url = URL(string: "http://\(mentor!.phone)") {
            UIApplication.shared.open(url)
        }
    }
}
