//
//  ReposetriesVC.swift
//  XCodeTask
//
//  Created by Sayed Abdo on 6/7/18.
//  Copyright © 2018 Bombo. All rights reserved.
//

import UIKit


class ReposetriesVC: UITableViewController, UpdateReposetriesListDelegate {
       let viewModel : ReposetriesViewModel = ReposetriesViewModel.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if viewModel.networkObj.isConnectedToInternet() {
            viewModel.updateDelegate = self
            viewModel.getDataFromAPI(url: URLs.github.rawValue)
            
        }else{
            showNetworkAlert()
        }
        
           }
    func updateList() {
        tableView.reloadData()
    }

    func setReposetryAttributes(cell: UITableViewCell, reposetry : Reposetry) {
        let repoName = cell.viewWithTag(1) as! UILabel
        repoName.text = reposetry.repoName
        
        let repoDesc = cell.viewWithTag(2) as! UILabel
        repoDesc.text = reposetry.repoDisc
        
        let repoLang = cell.viewWithTag(6) as! UILabel
        repoLang.text = reposetry.repoLang
        
        let repoForks = cell.viewWithTag(3) as! UILabel
        repoForks.text = "\(reposetry.repoForks)"
        
        let repoStars = cell.viewWithTag(4) as! UIButton
        repoStars.setTitle(String(reposetry.repoStars_count), for: .normal)
     
        let repoUpdate = cell.viewWithTag(5) as! UILabel
        repoUpdate.text = reposetry.repoUpdatedDate
       
        
    }
    
    func showNetworkAlert()  {
        let alert = UIAlertController(title: "No internet connection", message: "please open internet to load data ", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler:{ action in
            
            if let url = URL(string:"App-Prefs:root=Network&path=Location") {
                if UIApplication.shared.canOpenURL(url) {
                    _ =  UIApplication.shared.open(url, options: [:], completionHandler: nil)
                }
            }
            
        }))
    }
    
}


// MARK: - Table view data source

extension ReposetriesVC{
   
    override func numberOfSections(in tableView: UITableView) -> Int {
       
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return viewModel.reposetries.count
    }
    
    
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
     setReposetryAttributes(cell: cell, reposetry: viewModel.reposetries[indexPath.row])
     return cell
     }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableViewAutomaticDimension
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.selectedRepo = viewModel.reposetries[indexPath.row]
        
        let repoWV = storyboard?.instantiateViewController(withIdentifier: "repoWV") as! RepoWebViewVC
        self.navigationController?.pushViewController(repoWV, animated: true)
    }
    
}
