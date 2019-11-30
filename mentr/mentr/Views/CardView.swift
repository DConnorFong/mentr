//
//  CardView.swift
//  mentr
//
//  Created by Wren Liang on 2019-11-30.
//  Copyright © 2019 Wren Liang. All rights reserved.
//

//CREDIT TINDER SWIPE INTERFACE


import UIKit

class CardView: UIView {
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView(frame: self.frame)
        imageView.image = UIImage(named: "head-1")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()
    
    var divisor: CGFloat = 0.0
    
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
        
        addPanGesture()
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
    
    
    //MARK: - Private Helper Methods
    private func setupConstraints() {
        //CardView Setup
        self.layer.cornerRadius = 15
        self.clipsToBounds = true
        
        
        //Children Setup
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        imageView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    
    
    
    
    
    
    
    
    //MARK: - Swipe Gesture Handling
    
    private func addPanGesture(){
        self.isUserInteractionEnabled = true
        addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture)))
    }
    
    //Sourced from open-source project on GitHub
    //Link:
    @objc
    func handlePanGesture(sender: UIPanGestureRecognizer) {
        let card = sender.view as! CardView
        let point = sender.translation(in: self.superview) //test this
        
        let centerOfParentContainer = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2)
        
        card.center = CGPoint(x: centerOfParentContainer.x + point.x, y: centerOfParentContainer.y + point.y)
         
        let distanceFromCenter = ((UIScreen.main.bounds.width / 2) - card.center.x)
        
        divisor = ((UIScreen.main.bounds.width / 2) / 0.61)
        
        switch sender.state {
            // --- Case: gesture ended --- //
            case .ended:
                //swiped past horizontal threshold
                if (card.center.x) > 200 {
                    delegate?.swipeDidEnd(view: card)
                    UIView.animate(withDuration: 0.2) {
                        card.center = CGPoint(x: centerOfParentContainer.x + point.x + 200, y: centerOfParentContainer.y + point.y + 75)
                     card.alpha = 0
                     self.layoutIfNeeded()
                }
                    
                //swiped past vertical threshold
                } else if card.center.x < -40 {
                delegate?.swipeDidEnd(view: card)
                UIView.animate(withDuration: 0.2) {
                     card.center = CGPoint(x: centerOfParentContainer.x + point.x - 200, y: centerOfParentContainer.y + point.y + 75)
                     card.alpha = 0
                     self.layoutIfNeeded()
                }
                
                //reset to original position
                } else {
                    UIView.animate(withDuration: 0.2) {
                    card.transform = .identity
                    card.center = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2)
                    self.layoutIfNeeded()
                    }
                }
                return
            
            // --- Case: gesture updated --- //
            case .changed:
                let rotation = tan(point.x / (self.frame.width * 2.0))
                card.transform = CGAffineTransform(rotationAngle: rotation)
            
            // --- Case: default --- //
            default:
                break
         }
        
        
        
    }
    
    //add tap recognition later
    
    
    

    
    
}


