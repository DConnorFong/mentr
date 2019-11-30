//
//  MentorListViewController.swift
//  mentr
//
//  Created by Wren Liang on 2019-11-30.
//  Copyright © 2019 Wren Liang. All rights reserved.
//

import UIKit

class MentorListViewController: UIViewController {
    
    var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newView = MentorListView()
        tableView = newView.tableView
        self.view = newView
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Pantry"
        tableView.dataSource = self
        tableView.delegate = self
        
        //tableView.register(MentorListTableViewCell.self, forCellReuseIdentifier: "MentorCell")
        tableView.separatorStyle = .none
    }
}

extension MentorListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MentorCell", for: indexPath)
        
        guard let pantryCell = cell as? MentorListTableViewCell else {
            return cell
        }

        
        return pantryCell
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       //TODO: PUSH SHIT
    }
    
}
