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
        label.text = "My Profile"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var personImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "mentr8")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Futura-Bold", size: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Stephanie Chen"
        return label
    }()
   lazy var facultyLabel: UILabel = {
       let label = UILabel()
       label.font = UIFont(name: "Futura-Bold", size: 16)
       label.textColor = .blue
       label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Faculty Of Interest"
       return label
   }()
    
    lazy var engineeringLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Futura-Bold", size: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
         label.text = "Engineering"
        return label
    }()
    
    lazy var scienceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Futura-Bold", size: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
         label.text = "Science"
        return label
    }()
    
    lazy var commerceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Futura-Bold", size: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
         label.text = "Commerce"
        return label
    }()
    
    lazy var checkBox: UIButton = {
        let button = UIButton()
        button.isSelected = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 20
        button.setImage(UIImage(named: "hollow"), for: .normal)
        button.setImage(UIImage(named: "selected"), for: .selected)
        return button
    }()
    lazy var checkBox2: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 20
        button.setImage(UIImage(named: "hollow"), for: .normal)
        button.setImage(UIImage(named: "selected"), for: .selected)
        return button
    }()
    lazy var checkBox3: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 20
        button.setImage(UIImage(named: "hollow"), for: .normal)
        button.setImage(UIImage(named: "selected"), for: .selected)
        return button
    }()
    
    lazy var backView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Colors().colorMap["orange"]
        view.layer.cornerRadius = 20
        return view
    }()

   override class var requiresConstraintBasedLayout: Bool {
     return true
   }
   override init(frame: CGRect) {
       super.init(frame: frame)
    backgroundColor = .white
       layoutView()
   }
   required init?(coder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
   }
   func layoutView() {
        addSubview(settingsLabel)
        addSubview(backView)
        addSubview(personImage)
        addSubview(nameLabel)
        addSubview(facultyLabel)
        addSubview(checkBox)
        addSubview(checkBox2)
        addSubview(checkBox3)
        addSubview(engineeringLabel)
        addSubview(scienceLabel)
        addSubview(commerceLabel)
        setupConstraints()
   }
    func setupConstraints() {
        settingsLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        settingsLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        
        personImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        personImage.topAnchor.constraint(equalTo: settingsLabel.bottomAnchor, constant: 30).isActive = true
        personImage.heightAnchor.constraint(equalToConstant: 260).isActive = true
        personImage.widthAnchor.constraint(equalToConstant: 260).isActive = true
        
        backView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width-40).isActive = true
        backView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        backView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        backView.centerYAnchor.constraint(equalTo: personImage.centerYAnchor).isActive = true
        
        nameLabel.topAnchor.constraint(equalTo: personImage.bottomAnchor, constant: 35).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width-40).isActive = true
        
        facultyLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10).isActive = true
        facultyLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        
        checkBox.topAnchor.constraint(equalTo: facultyLabel.bottomAnchor, constant: 10).isActive = true
        checkBox.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        checkBox.heightAnchor.constraint(equalToConstant: 40).isActive = true
        checkBox.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        checkBox2.topAnchor.constraint(equalTo: checkBox.bottomAnchor, constant: 10).isActive = true
        checkBox2.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        checkBox2.heightAnchor.constraint(equalToConstant: 40).isActive = true
        checkBox2.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        checkBox3.topAnchor.constraint(equalTo: checkBox2.bottomAnchor, constant: 10).isActive = true
        checkBox3.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        checkBox3.heightAnchor.constraint(equalToConstant: 40).isActive = true
        checkBox3.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        engineeringLabel.centerYAnchor.constraint(equalTo: checkBox.centerYAnchor).isActive = true
        engineeringLabel.leftAnchor.constraint(equalTo: checkBox.rightAnchor, constant: 20).isActive = true
        
        scienceLabel.centerYAnchor.constraint(equalTo: checkBox2.centerYAnchor).isActive = true
        scienceLabel.leftAnchor.constraint(equalTo: checkBox2.rightAnchor, constant: 20).isActive = true

        commerceLabel.centerYAnchor.constraint(equalTo: checkBox3.centerYAnchor).isActive = true
        commerceLabel.leftAnchor.constraint(equalTo: checkBox3.rightAnchor, constant: 20).isActive = true


        


    }
}
