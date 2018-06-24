//
//  StarsVCTableViewController.swift
//  XCodeTask
//
//  Created by Sayed Abdo on 6/7/18.
//  Copyright © 2018 Bombo. All rights reserved.
//

import UIKit
import SDWebImage
class StarsVC: UITableViewController, UpdateReposetriesListDelegate {
    
    let viewModel : ReposetriesViewModel = ReposetriesViewModel.shared
    override func viewDidLoad() {
        super.viewDidLoad()
            viewModel.updateDelegate = self
            viewModel.isUser = true
            viewModel.getDataFromAPI(url: (viewModel.usersUrl))
         }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return viewModel.users.count
    }

    func setUserAttributes(cell: UITableViewCell, user : User) {
        let name = cell.viewWithTag(2) as! UILabel
        name.text = user.name
        
        let image = cell.viewWithTag(1) as! UIImageView
        image.sd_setImage(with: URL(string: user.image), completed: nil)
    
        let type = cell.viewWithTag(3) as! UILabel
        type.text = user.type
    
    }
    
    func updateList() {
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath)
        setUserAttributes(cell: cell, user: viewModel.users[indexPath.row])
        return cell
    }
 

    

}
