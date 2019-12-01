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
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        stackView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        stackView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0).isActive = true
        stackView.widthAnchor.constraint(equalToConstant: 350).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 500).isActive = true
        
        headerLabel.leftAnchor.constraint(equalTo: leftAnchor, constant:30).isActive = true
        headerLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant:40).isActive = true

    }
}
