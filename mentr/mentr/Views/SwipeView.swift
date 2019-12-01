//
//  SwipeView.swift
//  mentr
//
//  Created by Wren Liang on 2019-11-30.
//  Copyright © 2019 Wren Liang. All rights reserved.
//

import UIKit

class SwipeView: UIView {
    lazy var stackView: StackWrapperView = {
        let view = StackWrapperView(frame: self.frame)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Futura-Bold", size: 36)
        label.text = "Find Mentors"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var leftArrow: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "right-arrow")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var rightArrow: UIImageView = {
       let imageView = UIImageView()
       imageView.translatesAutoresizingMaskIntoConstraints = false
       imageView.image = UIImage(named: "left-arrow")
       imageView.contentMode = .scaleAspectFit
       imageView.translatesAutoresizingMaskIntoConstraints = false
       return imageView
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
        backgroundColor = .white
        addSubview(stackView)
        addSubview(headerLabel)
        addSubview(leftArrow)
        addSubview(rightArrow)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        stackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        stackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        stackView.bottomAnchor.constraint(equalTo: leftArrow.topAnchor, constant: -50).isActive = true
        stackView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 20).isActive = true

        
        headerLabel.leftAnchor.constraint(equalTo: leftAnchor, constant:30).isActive = true
        headerLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant:40).isActive = true
        
        leftArrow.widthAnchor.constraint(equalToConstant: 50).isActive = true
        leftArrow.heightAnchor.constraint(equalToConstant: 50).isActive = true
        leftArrow.leftAnchor.constraint(equalTo: leftAnchor, constant:40).isActive = true
        leftArrow.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant:-20).isActive = true
        
        rightArrow.widthAnchor.constraint(equalToConstant: 50).isActive = true
        rightArrow.heightAnchor.constraint(equalToConstant: 50).isActive = true
        rightArrow.rightAnchor.constraint(equalTo: rightAnchor, constant:-40).isActive = true
        rightArrow.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant:-20).isActive = true
        

    }
}
