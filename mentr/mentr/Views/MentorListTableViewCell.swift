//
//  MentorListTableViewCell.swift
//  mentr
//
//  Created by Wren Liang on 2019-11-30.
//  Copyright © 2019 Wren Liang. All rights reserved.
//
import UIKit

class MentorListTableViewCell: UITableViewCell {
    lazy var personImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "head-1")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: "Futura-Bold", size: 24)
        label.text = "Name Here"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var facultyLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Futura-Bold", size: 16)
        label.textAlignment = .center
        label.text = "Faculty Here"
        label.textColor = .blue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override class var requiresConstraintBasedLayout: Bool {
        return true
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 15, left: 20, bottom: 15, right: 20))
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        setupView()
    }
    
    func setupView() {
        addSubview(personImage)
        addSubview(nameLabel)
        addSubview(facultyLabel)
        
        contentView.backgroundColor = .white
        setupConstraints()
        contentView.layer.cornerRadius = 30
        contentView.layer.masksToBounds = false
        contentView.clipsToBounds = false
//        contentView.layer.shadowColor = UIColor.gray.cgColor
//        contentView.layer.shadowOpacity = 0.2
//        contentView.layer.shadowOffset = .zero
//        contentView.layer.shadowRadius = 7
//        contentView.layer.shadowPath = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width-20, height: 120), cornerRadius: 30).cgPath
//        contentView.layer.shouldRasterize = true
//        contentView.layer.rasterizationScale = UIScreen.main.scale
    }
    
    func setupConstraints() {
        personImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        personImage.leftAnchor.constraint(equalTo: leftAnchor, constant: 30).isActive = true
        personImage.heightAnchor.constraint(equalToConstant: 90).isActive = true
        personImage.widthAnchor.constraint(equalToConstant: 90).isActive = true
        
        
        nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 40).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: personImage.rightAnchor, constant: 10).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        
        facultyLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10).isActive = true
        facultyLabel.leftAnchor.constraint(equalTo: personImage.rightAnchor, constant: 10).isActive = true
        facultyLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        
    }
}
