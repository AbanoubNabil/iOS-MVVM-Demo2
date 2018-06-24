//
//  Photo.swift
//  MojazTask
//
//  Created by Sayed Abdo on 5/27/18.
//  Copyright © 2018 Bombo. All rights reserved.
//

import UIKit

class Reposetry: NSObject {
    
    var repoName : String = ""
    var repoDisc : String?
    var repoStars_count : Int = 0
    var repoUpdatedDate : String = ""
    var repoLang : String = ""
    var repoForks : Int = 0
    var repoStars_url : String = ""
    var repo_url: String = ""

    
    override init() {
    }
    
    init(dictionary: Dictionary<String,Any>)
    {
        repoName = dictionary["name"] as? String ?? "no value"
        print(repoName)
        repoDisc = dictionary["description"] as? String ?? "no value"
        repo_url = dictionary["html_url"] as? String ?? "no value"
        repoStars_url = dictionary["stargazers_url"] as? String ?? "no value"
        repoLang = dictionary["language"] as? String ?? "no value"
        repoForks = dictionary["forks_count"] as? Int ?? 0
        repoUpdatedDate = dictionary["updated_at"] as? String ?? "no value"
        repoStars_count = dictionary["stargazers_count"] as? Int ?? 0
    print(repoStars_count)
    }
    public class func modelsFromArray(array:[Dictionary<String,Any>]) -> [Reposetry]
    {
        var models:[Reposetry] = []
        for item in array
        {
            models.append(Reposetry.init(dictionary: item))
        }
        return models
    }
}
