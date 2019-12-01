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
    //MARK: - Subviews
    lazy var imageView: UIImageView = {
        let imageView = UIImageView(frame: self.frame)
        imageView.image = nil
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false

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
    lazy var bioLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Futura", size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "My name is Wren Liang and I am from calgary alberta la da da da da d ad a da da ad  a"
        label.numberOfLines = 7
        return label
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

    
    var divisor: CGFloat = 0.0
    
    var delegate: SwipeCardsDelegate?
    
    var modalDelegate: ModalDelegate?
    
    var dataSource: ServerPerson? {
        didSet {
            print("didset datasource")
            //imageView.image = dataSource?.animoji
            
            if let dataSource = dataSource {
                nameLabel.text = dataSource.firstName + " " + dataSource.lastName
                
                facultyLabel.text = dataSource.faculty.rawValue
                schoolLabel.text = dataSource.university.rawValue
                
                skillLabel1.text = dataSource.interests[0]
                skillLabel2.text = dataSource.interests[1]
                skillLabel3.text = dataSource.interests[2]
                
            }
            
            
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
        self.addSubview(descriptionView)
        
        descriptionView.addSubview(nameLabel)
        descriptionView.addSubview(schoolLabel)
        descriptionView.addSubview(bioLabel)
        descriptionView.addSubview(facultyLabel)
        descriptionView.addSubview(skillsView1)
        descriptionView.addSubview(skillsView2)
        descriptionView.addSubview(skillsView3)
        
        skillsView1.addSubview(skillLabel1)
        skillsView2.addSubview(skillLabel2)
        skillsView3.addSubview(skillLabel3)

        setupConstraints()
    }
    
    
    //MARK: - Private Helper Methods
    private func setupConstraints() {
        //CardView Setup
        self.layer.cornerRadius = 15
        self.clipsToBounds = true
        
        
        //Children Setup
        imageView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        imageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        imageView.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        
        
        //From Alan
        descriptionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        descriptionView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        descriptionView.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        descriptionView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10).isActive = true

        nameLabel.topAnchor.constraint(equalTo: descriptionView.topAnchor, constant: 10).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: descriptionView.leftAnchor, constant: 10).isActive = true

        facultyLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10).isActive = true
        facultyLabel.leftAnchor.constraint(equalTo: descriptionView.leftAnchor, constant: 10).isActive = true

        schoolLabel.topAnchor.constraint(equalTo: facultyLabel.bottomAnchor, constant: 10).isActive = true
        schoolLabel.leftAnchor.constraint(equalTo: descriptionView.leftAnchor, constant: 10).isActive = true

        let size: CGFloat = 300
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
        
        bioLabel.topAnchor.constraint(equalTo: skillsView1.bottomAnchor, constant: 10).isActive = true
        bioLabel.leftAnchor.constraint(equalTo: descriptionView.leftAnchor, constant: 10).isActive =  true
        bioLabel.rightAnchor.constraint(equalTo: descriptionView.rightAnchor, constant: -10).isActive =  true


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
                //swiped past right threshold
                if (card.center.x) > 40 {
                    print("right")
                    delegate?.swipeDidEnd(view: card)
                    UIView.animate(withDuration: 0.2) {
                        card.center = CGPoint(x: centerOfParentContainer.x + point.x + 200, y: centerOfParentContainer.y + point.y + 75)
                     card.alpha = 0
                     self.layoutIfNeeded()
                     let modalView = ModalPopUpViewController()
                        modalView.selectedPerson = self.dataSource
                        
                        
                }
                    
                //swiped past left threshold
                } else if card.center.x < -40 {
                    print("left")
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


