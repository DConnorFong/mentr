//
//  ModalView.swift
//  mentr
//
//  Created by Alan Yan on 2019-11-30.
//  Copyright © 2019 Wren Liang. All rights reserved.
//

import UIKit

class ModalView: UIView {
    lazy var settingsLabel: UILabel = {
         let label = UILabel()
         label.font = UIFont(name: "Futura-Bold", size: 30)
         label.text = "You've Been Matched!"
         label.textAlignment = .center
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
        label.textAlignment = .center
        return label
    }()
    lazy var doneButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(displayP3Red: 234/255, green: 249/255, blue: 230/255, alpha: 1)
        button.layer.cornerRadius = 40
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "checkmark"), for: .normal)
        button.setImage(UIImage(systemName: "checkmark"), for: .selected)
        button.imageView?.contentMode = .scaleAspectFit
        return button
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
        addSubview(personImage)
        addSubview(nameLabel)
        addSubview(doneButton)
         setupConstraints()
    }
     func setupConstraints() {
         settingsLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
         settingsLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        personImage.topAnchor.constraint(equalTo: settingsLabel.bottomAnchor, constant: 10).isActive = true
        personImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        personImage.heightAnchor.constraint(equalToConstant: 286).isActive = true
        personImage.widthAnchor.constraint(equalToConstant: 286).isActive = true
        
        
        nameLabel.topAnchor.constraint(equalTo: personImage.bottomAnchor, constant: 35).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width-40).isActive = true
        
        doneButton.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10).isActive = true
        doneButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        doneButton.heightAnchor.constraint(equalToConstant: 80).isActive = true
        doneButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
    

         


     }
}
