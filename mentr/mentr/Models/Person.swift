//
//  Person.swift
//  mentr
//
//  Created by Wren Liang on 2019-11-30.
//  Copyright © 2019 Wren Liang. All rights reserved.
//

import UIKit

struct Person {
    var name: String
    var animoji: UIImage?
    var major: majors
    var university: String
    var skills: [String]
    var bio: String
    
    //MARK: - Contact
    var facebook: String
    var email: String
    var phoneNum: String
    var wechat: String
}


enum majors {
    //MARK: - Engineering
    case cpen
    case elec
    case civl
    case mech
    
    //MARK: - Science
    case cpsc
    case biol
    case chem
    
    
    //MARK: - Arts
    case film
    case music
    case visual
    case history
    
    //MARK: - Kinesiology
    case kines
    
}
