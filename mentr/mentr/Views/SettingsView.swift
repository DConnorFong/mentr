//
//  SettingsView.swift
//  mentr
//
//  Created by Stephanie Chen on 2019-11-30.
//  Copyright © 2019 Wren Liang. All rights reserved.
//

import UIKit

class SettingsView: UIView {
    lazy var settingsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Futura-Bold", size: 36)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var personImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "head-1")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
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
        return button
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
        addSubview(settingsLabel)
        addSubview(personImage)
        addSubview(nameLabel)
        addSubview(facultyLabel)
    
        setupConstraints()
   }
    func setupConstraints() {
        settingsLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        settingsLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        
        personImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        personImage.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 20).isActive = true
        personImage.heightAnchor.constraint(equalToConstant: 260).isActive = true
        personImage.widthAnchor.constraint(equalToConstant: 260).isActive = true

    }
}
