//
//  CardView.swift
//  mentr
//
//  Created by Wren Liang on 2019-11-30.
//  Copyright © 2019 Wren Liang. All rights reserved.
//

import UIKit

class CardView: UIView {
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView(frame: self.frame)
        imageView.image = UIImage(named: "head-1")
        
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()
    
    var personData: Person?
    var delegate: SwipeCardsDelegate?
    
    var dataSource: Person? {
        didSet {
            //update view information on this view
        }
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
        backgroundColor = .white
        
        self.addSubview(imageView)

        setupConstraints()
    }
    private func setupConstraints() {
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        imageView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
}

protocol SwipeCardsDelegate {
    func swipeDidEnd(view: CardView)
}


extension CardView: SwipeCardsDelegate {
    func swipeDidEnd(view: CardView) {
        //
    }
    
    
}
