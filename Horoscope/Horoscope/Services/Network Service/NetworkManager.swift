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
        
        let requestURL = NSMutableURLRequest(url: NSURL(string: "\(baseURL + endpoint)")! as URL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)

        requestURL.httpMethod = requestMethod.rawValue
        requestURL.allHTTPHeaderFields = headers

        let urlSession = URLSession.shared

        let requestUID = UUID().uuidString

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
//            completion(data , nil)
        }

        logger.printRESTRequestLogs(uid: requestUID, method: requestMethod, url: "\(baseURL) + \(endpoint)", params: params, headers: headers ?? ["":""], body: nil)

        task.resume()
    }
    
    
    
}



