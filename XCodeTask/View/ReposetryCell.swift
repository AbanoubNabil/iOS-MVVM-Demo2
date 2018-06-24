//
//  FacilityCell.swift
//  LinkDevTask
//
//  Created by Sayed Abdo on 5/31/18.
//  Copyright © 2018 Bombo. All rights reserved.
//

import UIKit

class ReposetryCell : UIView {
 
    @IBOutlet weak var reightView: UIView!
    @IBOutlet weak var leftView: UIView!
    @IBOutlet var reposetryView: UIView!
    var viewModel = ReposetriesViewModel.shared
    @IBAction func userAction(_ sender: Any) {
        let cell: UITableViewCell = leftView.superview!.superview?.superview?.superview as! UITableViewCell
        let table: UITableView = cell.superview as! UITableView
        let index = table.indexPath(for: cell)
       viewModel.usersUrl = viewModel.reposetries[(index?.row)!].repoStars_url
        
        let starsVC : StarsVC = UIStoryboard(name: "Main", bundle:nil).instantiateViewController(withIdentifier: "StarsVC") as! StarsVC
        
        let currentController = self.getCurrentViewController()
        currentController?.present(starsVC, animated: false, completion: nil)

    }
    
    func getCurrentViewController() -> UIViewController? {
        
        if let rootController = UIApplication.shared.keyWindow?.rootViewController {
            var currentController: UIViewController! = rootController
            while( currentController.presentedViewController != nil ) {
                currentController = currentController.presentedViewController
            }
            return currentController
        }
        return nil
        
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCell()
    }
    private func commonInit() {
        setupNip()
    }
}
extension ReposetryCell{

    func setupCell() {
        reposetryView.layer.cornerRadius=8
        reposetryView.layer.masksToBounds=false
        reposetryView.layer.shadowOffset=CGSize(width: 0, height: 4)
        reposetryView.layer.shadowOpacity=0.5
    }

    func setupNip(){
        Bundle.main.loadNibNamed("ReposetryCell", owner: self, options: nil)
        addSubview(reposetryView)
        reposetryView.frame = self.bounds
        reposetryView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }

    override func layoutSubviews() {
            super.layoutSubviews()
            leftView.roundCorners([.topLeft , .bottomLeft], radius: 8)
            reightView.roundCorners([.topRight , .bottomRight], radius: 8)
    }

}

