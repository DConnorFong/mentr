//
//  ModalPopUp.swift
//  mentr
//
//  Created by Alan Yan on 2019-11-30.
//  Copyright © 2019 Wren Liang. All rights reserved.
//

import UIKit


class ModalPopUpViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newView = ModalView()
        newView.doneButton.addTarget(self, action: #selector(closeView), for: .touchUpInside)
        self.view = newView
    }
    
    @objc func closeView() {
        dismiss(animated: true) {
            print("closed")
        }
    }
}
