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
        view.backgroundColor = .blue
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
        backgroundColor = .yellow
        
        addSubview(stackView)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        stackView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        stackView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0).isActive = true
        stackView.widthAnchor.constraint(equalToConstant: 400).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 400).isActive = true
    }
}
