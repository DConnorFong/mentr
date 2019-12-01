//
//  DetailMentorView.swift
//  mentr
//
//  Created by Wren Liang on 2019-11-30.
//  Copyright © 2019 Wren Liang. All rights reserved.
//

import UIKit
class DetailMentorView: UIView {
    
    
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
    lazy var schoolLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Futura-Bold", size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
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
    lazy var facebookButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "facebook"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()
    lazy var emailButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "email"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()
    lazy var linkedinButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "linkedin"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()
    lazy var phoneNumButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "phone"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()
    lazy var wechatButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "wechat"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()
    lazy var descriptionView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        return view
    }()
    lazy var skillsView1: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        view.layer.cornerRadius = 10
        return view
    }()
    lazy var skillsView2: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .yellow
        view.layer.cornerRadius = 10
        return view
    }()
    lazy var skillsView3: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .green
        view.layer.cornerRadius = 10
        return view
    }()
    lazy var skillLabel1:UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Futura-Bold", size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center

        return label
    }()
    lazy var skillLabel2:UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Futura-Bold", size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    lazy var skillLabel3:UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Futura-Bold", size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
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
    private func setupConstraints() {
        personImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        personImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        personImage.heightAnchor.constraint(equalToConstant: 286).isActive = true
        personImage.widthAnchor.constraint(equalToConstant: 286).isActive = true
        
        facebookButton.bottomAnchor.constraint(equalTo: personImage.topAnchor).isActive = true
        facebookButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 40).isActive = true
        facebookButton.heightAnchor.constraint(equalToConstant: 75).isActive = true
        facebookButton.widthAnchor.constraint(equalToConstant: 75).isActive = true
        
        wechatButton.bottomAnchor.constraint(equalTo: personImage.topAnchor).isActive = true
        wechatButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -40).isActive = true
        wechatButton.heightAnchor.constraint(equalToConstant: 75).isActive = true
        wechatButton.widthAnchor.constraint(equalToConstant: 75).isActive = true
        
        phoneNumButton.bottomAnchor.constraint(equalTo: personImage.topAnchor, constant: -150).isActive = true
        phoneNumButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 40).isActive = true
        phoneNumButton.heightAnchor.constraint(equalToConstant: 75).isActive = true
        phoneNumButton.widthAnchor.constraint(equalToConstant: 75).isActive = true
        
        emailButton.bottomAnchor.constraint(equalTo: personImage.topAnchor, constant: -150).isActive = true
        emailButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -40).isActive = true
        emailButton.heightAnchor.constraint(equalToConstant: 75).isActive = true
        emailButton.widthAnchor.constraint(equalToConstant: 75).isActive = true
        
        linkedinButton.bottomAnchor.constraint(equalTo: personImage.topAnchor, constant: -75).isActive = true
        linkedinButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        linkedinButton.heightAnchor.constraint(equalToConstant: 75).isActive = true
        linkedinButton.widthAnchor.constraint(equalToConstant: 75).isActive = true
        
        
        descriptionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
        descriptionView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        descriptionView.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        descriptionView.topAnchor.constraint(equalTo: personImage.bottomAnchor, constant: 10).isActive = true

        nameLabel.topAnchor.constraint(equalTo: descriptionView.topAnchor, constant: 10).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: descriptionView.leftAnchor, constant: 10).isActive = true
        
        facultyLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10).isActive = true
        facultyLabel.leftAnchor.constraint(equalTo: descriptionView.leftAnchor, constant: 10).isActive = true
        
        schoolLabel.topAnchor.constraint(equalTo: facultyLabel.bottomAnchor, constant: 10).isActive = true
        schoolLabel.leftAnchor.constraint(equalTo: descriptionView.leftAnchor, constant: 10).isActive = true
        
        let size: CGFloat = 380
        skillsView1.widthAnchor.constraint(equalToConstant: size/3.2).isActive = true
        skillsView1.topAnchor.constraint(equalTo: schoolLabel.bottomAnchor, constant: 10).isActive = true
        skillsView1.leftAnchor.constraint(equalTo: descriptionView.leftAnchor, constant: 10).isActive = true
        skillsView1.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        skillsView2.widthAnchor.constraint(equalToConstant: size/3.2).isActive = true
        skillsView2.topAnchor.constraint(equalTo: schoolLabel.bottomAnchor, constant: 10).isActive = true
        skillsView2.leftAnchor.constraint(equalTo: skillsView1.rightAnchor, constant: 10).isActive = true
        skillsView2.heightAnchor.constraint(equalToConstant: 30).isActive = true

    
        skillsView3.widthAnchor.constraint(equalToConstant: size/3.2).isActive = true
        skillsView3.topAnchor.constraint(equalTo: schoolLabel.bottomAnchor, constant: 10).isActive = true
        skillsView3.leftAnchor.constraint(equalTo: skillsView2.rightAnchor, constant: 10).isActive = true
        skillsView3.heightAnchor.constraint(equalToConstant: 30).isActive = true

        skillLabel1.leftAnchor.constraint(equalTo: skillsView1.leftAnchor).isActive = true
        skillLabel1.rightAnchor.constraint(equalTo: skillsView1.rightAnchor).isActive = true
        skillLabel1.topAnchor.constraint(equalTo: skillsView1.topAnchor).isActive = true
        skillLabel1.bottomAnchor.constraint(equalTo: skillsView1.bottomAnchor).isActive = true
        
        skillLabel2.leftAnchor.constraint(equalTo: skillsView2.leftAnchor).isActive = true
        skillLabel2.rightAnchor.constraint(equalTo: skillsView2.rightAnchor).isActive = true
        skillLabel2.topAnchor.constraint(equalTo: skillsView2.topAnchor).isActive = true
        skillLabel2.bottomAnchor.constraint(equalTo: skillsView2.bottomAnchor).isActive = true
    
        skillLabel3.leftAnchor.constraint(equalTo: skillsView3.leftAnchor).isActive = true
        skillLabel3.rightAnchor.constraint(equalTo: skillsView3.rightAnchor).isActive = true
        skillLabel3.topAnchor.constraint(equalTo: skillsView3.topAnchor).isActive = true
        skillLabel3.bottomAnchor.constraint(equalTo: skillsView3.bottomAnchor).isActive = true


        
        
        
        
    }
}
