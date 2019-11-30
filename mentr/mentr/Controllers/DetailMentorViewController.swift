//
//  DetailMentorViewController.swift
//  mentr
//
//  Created by Wren Liang on 2019-11-30.
//  Copyright © 2019 Wren Liang. All rights reserved.
//

import UIKit

class DetailMentorViewController: UIViewController {
    var mentor: Person?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newView = DetailMentorView()
        newView.personImage.image = UIImage(named: "head-1") //CHNAGE THIS TO PERSON LATER
        newView.nameLabel.text = "Alan Yan"
        newView.facultyLabel.text = "Computer Engineering"
        self.view = newView
    }
}
