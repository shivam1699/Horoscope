//
//  NetworkManager.swift
//  Horoscope
//
//  Created by Thinkitive on 23/10/23.
//

import Foundation

class NetworkManager {
    
    let logger = LogService()
    
    func createRequests(headers : [String : String]? , baseURL : String , endpoint : String , requestMethod : HTTPRequestMethod , params : [String : String]?, completion : @escaping((Data?, Error?)->())){
        
        //create a url
        let requestURL = NSMutableURLRequest(url: NSURL(string: "\(baseURL + endpoint)")! as URL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        //set httpMethod
        requestURL.httpMethod = requestMethod.rawValue
        //set mandetory headers
        requestURL.allHTTPHeaderFields = headers
        //create a session on internet
        let urlSession = URLSession.shared
        
        let requestUID = UUID().uuidString
        //give that session a task
        let task = urlSession.dataTask(with: requestURL as URLRequest) { data, response, error in

            self.logger.printRESTResponseLogs(uid: requestUID, method: requestMethod, url: "\(baseURL)\(endpoint)", response: data, error: error)

            if error != nil{
                completion(nil, error)
                print(error?.localizedDescription as Any)
            }else{
                if let data = data {
                        print("Api Call successful")
                        completion(data , nil)
                }
            }
        }

        logger.printRESTRequestLogs(uid: requestUID, method: requestMethod, url: "\(baseURL) + \(endpoint)", params: params, headers: headers ?? ["":""], body: nil)
        
        //start the task on the session
        task.resume()
    }
    
    
    
}




func createRequest(){
    
   
}
