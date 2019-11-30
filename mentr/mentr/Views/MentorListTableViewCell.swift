//
//  MentorListTableViewCell.swift
//  mentr
//
//  Created by Wren Liang on 2019-11-30.
//  Copyright © 2019 Wren Liang. All rights reserved.
//
import UIKit

class MentorListTableViewCell: UITableViewCell {
    
    
    override class var requiresConstraintBasedLayout: Bool {
        return true
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        setupView()
    }
    
    func setupView() {
        contentView.backgroundColor = .white
        setupConstraints()
        contentView.layer.cornerRadius = 30
        contentView.layer.masksToBounds = false
        contentView.clipsToBounds = false
        contentView.layer.shadowColor = UIColor.gray.cgColor
        contentView.layer.shadowOpacity = 0.2
        contentView.layer.shadowOffset = .zero
        contentView.layer.shadowRadius = 7
        contentView.layer.shadowPath = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width-20, height: 80), cornerRadius: 30).cgPath
        contentView.layer.shouldRasterize = true
        contentView.layer.rasterizationScale = UIScreen.main.scale
    }
    
    func setupConstraints() {
        
    }
}
