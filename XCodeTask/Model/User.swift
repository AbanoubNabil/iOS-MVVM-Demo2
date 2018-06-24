//
//  User.swift
//  XCodeTask
//
//  Created by Sayed Abdo on 6/7/18.
//  Copyright © 2018 Bombo. All rights reserved.
//

import Foundation
//
//  Photo.swift
//  MojazTask
//
//  Created by Sayed Abdo on 5/27/18.
//  Copyright © 2018 Bombo. All rights reserved.
//

import UIKit

class User: NSObject {
    
    var name : String = ""
    var image : String = ""
    var type : String = ""
    var profile_url : String = ""
    
    
    override init() {
    }
    
    init(dictionary: Dictionary<String,Any>)
    {
        name = dictionary["login"] as! String
        print(name)
        image = dictionary["avatar_url"] as? String ?? "no value"
        type = dictionary["type"] as? String ?? "no value"
        profile_url = dictionary["html_url"] as? String ?? "no value"
        
    }
    public class func modelsFromArray(array:[Dictionary<String,Any>]) -> [User]
    {
        var models:[User] = []
        for item in array
        {
            models.append(User.init(dictionary: item))
        }
        return models
    }
}
