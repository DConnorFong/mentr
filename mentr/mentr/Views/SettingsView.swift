//
//  SettingsView.swift
//  mentr
//
//  Created by Stephanie Chen on 2019-11-30.
//  Copyright © 2019 Wren Liang. All rights reserved.
//

import UIKit

class SettingsView: UIView {
        lazy var personImage: UIImageView = {
           let imageView = UIImageView()
           imageView.image = UIImage(named: "head-1")
           imageView.translatesAutoresizingMaskIntoConstraints = false
           imageView.contentMode = .scaleAspectFit
           return imageView
        }()
        lazy var settingsLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont(name: "Futura-Bold", size: 36)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
       lazy var nameLabel: UILabel = {
           let label = UILabel()
           label.font = UIFont(name: "Futura-Bold", size: 24)
           label.translatesAutoresizingMaskIntoConstraints = false
           return label
       }()
       lazy var facultyLabel: UILabel = {
           let label = UILabel()
           label.font = UIFont(name: "Futura-Bold", size: 16)
           label.textColor = .blue
           label.translatesAutoresizingMaskIntoConstraints = false
           return label
       }()
    
    lazy var checkBox: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 20
    }()

           
       override class var requiresConstraintBasedLayout: Bool {
         return true
       }
       override init(frame: CGRect) {
           super.init(frame: frame)
           
           layoutView()
       }
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
       func layoutView() {
           backgroundColor = UIColor(displayP3Red: 234/255, green: 249/255, blue: 230/255, alpha: 1)
           addSubview(personImage)
           addSubview(descriptionView)
           
           addSubview(facebookButton)
           addSubview(linkedinButton)
           addSubview(phoneNumButton)
           addSubview(wechatButton)
           addSubview(emailButton)
           
           descriptionView.addSubview(nameLabel)
           descriptionView.addSubview(schoolLabel)
           descriptionView.addSubview(facultyLabel)
           descriptionView.addSubview(skillsView1)
           descriptionView.addSubview(skillsView2)
           descriptionView.addSubview(skillsView3)
           
           skillsView1.addSubview(skillLabel1)
           skillsView2.addSubview(skillLabel2)
           skillsView3.addSubview(skillLabel3)

           setupConstraints()
       }
}
