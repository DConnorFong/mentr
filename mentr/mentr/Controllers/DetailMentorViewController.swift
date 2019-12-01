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
//        newView.personImage.image = UIImage(named: "head-1") //CHNAGE THIS TO PERSON LATER
//        newView.nameLabel.text = "Alan Yan"
//        newView.facultyLabel.text = "Computer Engineering"
//        newView.schoolLabel.text = "University of British Columbia"
//        self.view = newView
//        newView.skillLabel1.text = "Swift/iOS"
//        newView.skillLabel2.text = "Java"
//        newView.skillLabel3.text = "App Dev"
        
        let number = mentor!.id % 10 + 1
        newView.personImage.image = UIImage(named: "mentr\(number)")
        newView.nameLabel.text = "\(mentor!.firstName) \(mentor!.lastName)"
        newView.facultyLabel.text = "\(mentor!.faculty)"
        newView.schoolLabel.text = "\(mentor!.university)"
        newView.skillLabel1.text = mentor!.interests[0]
        newView.skillLabel2.text = mentor!.interests[1]
        newView.skillLabel3.text = mentor!.interests[2]
        newView.facebookButton.addTarget(self, action: #selector(clickedFacebook), for: .touchUpInside)
        self.view = newView
        
    }
    
    @objc func clickedFacebook() {
        
    }
}
