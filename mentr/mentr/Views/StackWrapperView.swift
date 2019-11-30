//
//  StackWrapperView.swift
//  mentr
//
//  Created by Wren Liang on 2019-11-30.
//  Copyright © 2019 Wren Liang. All rights reserved.
//

import UIKit
class StackWrapperView: UIView {
    var numCardsToShow: Int = 0
    var remainingCards: Int = 0
    var numVisibleCards: Int = 3
    
    var swipeDataSource: SwipeCardDataSource? {
        didSet {
            reloadData()
         }
    }
    
    private func reloadData() {
        guard let swipeDataSource = swipeDataSource else {return}
        numCardsToShow = swipeDataSource.numberOfCardsToShow()
        remainingCards = numCardsToShow
        
        for i in 0...min(numCardsToShow, numVisibleCards) {
            
        }
    }
    
    private func addCardView(card: CardView, index: Int) {
        card.delegate = self
        
        
    }
    
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
        backgroundColor = .blue

        setupConstraints()
    }
    private func setupConstraints() {
    }
}


extension StackWrapperView: SwipeCardsDelegate {
    func swipeDidEnd(view: CardView) {
        <#code#>
    }
    
    
}
