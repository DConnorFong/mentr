//
//  CardView.swift
//  mentr
//
//  Created by Wren Liang on 2019-11-30.
//  Copyright © 2019 Wren Liang. All rights reserved.
//

import UIKit

class CardView: UIView {
    
    var personData: Person?
    var delegate: SwipeCardsDelegate?
    
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

protocol SwipeCardsDelegate {
    func swipeDidEnd(view: CardView)
}


extension CardView: SwipeCardsDelegate {
    func swipeDidEnd(view: CardView) {
        <#code#>
    }
    
    
}
