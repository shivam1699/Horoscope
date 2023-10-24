//
//  HoroscopeService.swift
//  Horoscope
//
//  Created by Thinkitive on 24/10/23.
//

import Foundation

class HoroscopeService {
    
    let networkManager = NetworkManager()
    let utils = UtilityFunctions()
    
    func getSigns(completion : @escaping(([String]? , ErrorResponseModel?)->())){
        networkManager.createRequests(headers: StaticHeaders.headers, baseURL: BaseURLs.baseURL, endpoint: Endponts.getSigns, requestMethod: .GET, params: nil) {  data, error in
                
                if let data = data {
                    let response = self.utils.decodeResponse(data: data, type: [String].self)
                    completion(response, nil)
                }else{
                    if error != nil{
                        let error = self.utils.decodeResponse(data: data ?? Data(), type: ErrorResponseModel.self)
                        completion(nil, error)
                    }
                }
            print("\(data ?? Data())")
            }
    }
}
