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
    var faculty: String
    var university: String
    var skills: [String]
    var bio: String
    var id: String
    
    //MARK: - Contact
    var facebook: String
    var email: String
    var phoneNum: String
    var wechat: String
    var linkedin: String
    
    
    init(id: String, name: String, animoji: UIImage, major: majors, faculty: String, university: String, skills: [String], bio: String, facebook: String, email: String, phoneNum: String, wechat: String, linkedin: String) {
        self.name = name
        self.animoji = animoji
        self.major = major
        self.faculty = faculty
        self.university = university
        self.skills = skills
        self.bio = bio
        self.facebook = facebook
        self.email = email
        self.phoneNum = phoneNum
        self.wechat = wechat
        self.id = id
        self.linkedin = linkedin
    }
    
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
