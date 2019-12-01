//
//  ModalPopUp.swift
//  mentr
//
//  Created by Alan Yan on 2019-11-30.
//  Copyright © 2019 Wren Liang. All rights reserved.
//

import UIKit


class ModalPopUpViewController: UIViewController {
    var selectedPerson: ServerPerson?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newView = ModalView()
        newView.doneButton.addTarget(self, action: #selector(closeView), for: .touchUpInside)
        self.view = newView
    }
    
    @objc func closeView() {
        savedMentors.append(selectedPerson!)
        dismiss(animated: true) {
            print("closed")
        }
    }
}
