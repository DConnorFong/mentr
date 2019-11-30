//
//  MentorListView.swift
//  mentr
//
//  Created by Stephanie Chen on 2019-11-30.
//  Copyright © 2019 Wren Liang. All rights reserved.
//

import UIKit

class MentorListView: UIView {
    
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

        setupConstraints()
    }
    private func setupConstraints() {
    }
    
    
}
