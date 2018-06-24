//
//  ImageViewMode.swift
//  MojazTask
//
//  Created by Sayed Abdo on 5/28/18.
//  Copyright © 2018 Bombo. All rights reserved.
//

import UIKit
class ReposetriesViewModel : NSObject {
    
    var networkObj = NetworkServiceLayer()
    static var  shared = ReposetriesViewModel()
    open var updateDelegate : UpdateReposetriesListDelegate?
    
    open var reposetries : [Reposetry] = [Reposetry]()
    open var users : [User] = [User]()
    open var usersUrl : String = ""
    open var selectedRepo : Reposetry?
    var isUser : Bool = false
    override private init() {
        
    }
    
    lazy var handlerBlock: ([Dictionary<String,Any>]) -> Void = { result in
        if self.isUser {
            print("from user handler \(result.count) ")
            self.users = User.modelsFromArray(array: result)
            self.updateDelegate?.updateList()
            self.isUser = false
        }else{
            print("from repo handler \(result.count) ")
            self.reposetries = Reposetry.modelsFromArray(array: result)
            self.updateDelegate?.updateList()
            
        }
        
    }
    
    func getDataFromAPI(url: String){
        networkObj.fetchRequest(completion: handlerBlock, myurl: url)
    }
   
}
