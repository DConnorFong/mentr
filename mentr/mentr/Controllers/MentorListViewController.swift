//
//  MentorListViewController.swift
//  mentr
//
//  Created by Wren Liang on 2019-11-30.
//  Copyright © 2019 Wren Liang. All rights reserved.
//

import UIKit

class MentorListViewController: UIViewController {
    var mentors: [Person] = []
    var tableView: UITableView!
    var colours: [UIColor] = [
        UIColor(displayP3Red: 234/255, green: 249/255, blue: 230/255, alpha: 1),
        UIColor(displayP3Red: 255/255, green: 233/255, blue: 166/255, alpha: 1),
        UIColor(displayP3Red: 230/255, green: 248/255, blue: 249/255, alpha: 1),
        UIColor(displayP3Red: 250/255, green: 208/255, blue: 202/255, alpha: 1)]
    override func viewDidLoad() {
        super.viewDidLoad()
        let newView = MentorListView()
        tableView = newView.tableView
        self.view = newView
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "MentR Matches"
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(MentorListTableViewCell.self, forCellReuseIdentifier: "MentorCell")
        tableView.separatorStyle = .none
    }
}

extension MentorListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MentorCell", for: indexPath)
        
        guard let mentorCell = cell as? MentorListTableViewCell else {
            return cell
        }
        mentorCell.contentView.backgroundColor = colours[indexPath.row%4]
       
        mentorCell.selectionStyle = .none
        
        return mentorCell
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let pushVC = DetailMentorViewController()
        pushVC.color = colours[indexPath.row%4]
        navigationController?.pushViewController(pushVC, animated: true)
    }
    
}
