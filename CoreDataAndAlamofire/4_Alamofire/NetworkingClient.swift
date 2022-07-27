//
//  NetworkingClient.swift
//  CoreDataAndAlamofire
//
//  Created by test on 27.07.2022.
//

import Foundation
import Alamofire

class NetworkingClient{
    
    typealias webSericeResonse = ([Repository]?, Error?) -> Void
    
    static func executeUrl(url: URL, completion: @escaping webSericeResonse) -> Void {
        
        Alamofire.request(url).validate().response { response in
            if let error = response.error{
                completion(nil, error)
            }else if let data = response.data{
                do{
                    var data = try JSONDecoder().decode([Repository].self, from: data)
                    completion(data, nil)
                }catch{
                    completion(nil, error)
                }
            }
        }
    }
}
