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
    
    var viewsOnStack: [CardView] = []
    
    var visibleCards: [CardView] {
        return subviews as? [CardView] ?? []
    }
    
    let horizontalInset: CGFloat = 10.0
    let verticalInset: CGFloat = 10.0
    
    var swipeDataSource: SwipeCardDataSource? {
        didSet {
            reloadData()
         }
    }
    
    private func reloadData() {
        removeAllCardViews()
        guard let swipeDataSource = swipeDataSource else {return}
        numCardsToShow = swipeDataSource.numberOfCardsToShow()
        remainingCards = numCardsToShow
        
        print("reloading data")
        
        setNeedsLayout()
        layoutIfNeeded()
        
        for i in 0..<min(numCardsToShow, numVisibleCards) {
            addCardView(card: swipeDataSource.cardAt(index: i), index: i)
        }
    }
    
    private func addCardView(card: CardView, index: Int) {
        card.delegate = self
        addCardFrame(index: index, cardView: card)
        viewsOnStack.append(card)
        insertSubview(card, at: 0)
        remainingCards -= 1
    }
    
    private func addCardFrame(index: Int, cardView: CardView) {
        var cardViewFrame = bounds
        let horizontalInset = (CGFloat(index) * self.horizontalInset)
        let verticalInset = CGFloat(index) * self.verticalInset
        
        cardViewFrame.size.width -= 2 * horizontalInset
        cardViewFrame.origin.x += horizontalInset
        cardViewFrame.origin.y += verticalInset
        
        cardView.frame = cardViewFrame
    }
    
    private func removeAllCardViews() {
        for cardView in visibleCards {
            cardView.removeFromSuperview()
        }
        viewsOnStack = []
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
        backgroundColor = UIColor.clear

        setupConstraints()
    }
    private func setupConstraints() {
    }
}


protocol SwipeCardsDelegate {
    func swipeDidEnd(view: CardView)
}

extension StackWrapperView: SwipeCardsDelegate {
    func swipeDidEnd(view: CardView) {
        guard let dataSource = swipeDataSource else { return }
        view.removeFromSuperview()

        if remainingCards > 0 {
            let newIndex = dataSource.numberOfCardsToShow() - remainingCards
            addCardView(card: dataSource.cardAt(index: newIndex), index: 2)
            for (cardIndex, cardView) in visibleCards.reversed().enumerated() {
                UIView.animate(withDuration: 0.2, animations: {
                cardView.center = self.center
                  self.addCardFrame(index: cardIndex, cardView: cardView)
                    self.layoutIfNeeded()
                })
            }

        }else {
            for (cardIndex, cardView) in visibleCards.reversed().enumerated() {
                UIView.animate(withDuration: 0.2, animations: {
                    cardView.center = self.center
                    self.addCardFrame(index: cardIndex, cardView: cardView)
                    self.layoutIfNeeded()
                })
            }
        }
    }
}
