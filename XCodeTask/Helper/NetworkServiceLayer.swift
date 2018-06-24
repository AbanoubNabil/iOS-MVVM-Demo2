//
//  NetworkServiceLayer.swift
//  MojazTask
//
//  Created by Sayed Abdo on 5/27/18.
//  Copyright © 2018 Bombo. All rights reserved.
//

import UIKit
import Alamofire

class NetworkServiceLayer: NSObject {
    
    func isConnectedToInternet() ->Bool {
        return NetworkReachabilityManager()!.isReachable
    }
    
    func fetchRequest(completion: @escaping ([Dictionary<String,Any>]) -> Void , myurl : String ) {
        guard let url = URL(string: myurl) else {
            completion([])
            return
        }
        let request = NSURLRequest(url: url)
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let task = session.dataTask(with: request as URLRequest) { (data, response, error) in
            do{
                
                let res = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [Dictionary<String,Any>]
                
                DispatchQueue.main.async {
                    completion(res)
                }
                
            }catch let er{
                print("\(er)")
            }
            
        }
        task.resume()
    }
    
}
