//
//  APIModel.swift
//  A202NetImage
//
//  Created by 申潤五 on 2022/3/6.
//

import Foundation
import Alamofire

class APIModel{
    static var share = APIModel.init()
    
    private init(){
        
    }
    private var apiURL = "https://randomuser.me/api/"

    
    func queryRandomUserAlamofire(completion:@escaping (_ Data:Any?,_ respError: Error?)->())->(){
        
        let url = apiURL
        
        AF.request(url,
                   method: .get,
                   parameters: nil,
                   encoding: URLEncoding.default,
                   headers: nil).responseJSON { respons in
            switch respons.result{
            case .success(_):
                return completion(respons.data,nil)
            case .failure(let error):
                return completion(nil,error)
            }

        }

        
    }
    
    
    
    
}




