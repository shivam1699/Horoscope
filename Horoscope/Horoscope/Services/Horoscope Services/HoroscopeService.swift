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
        networkManager.createRequests(headers: StaticHeaders.headers, baseURL: BaseURLs.baseURL, endpoint: Endpoints.getSigns, requestMethod: .GET, params: nil) {  data, error in
                
                if let data = data {
                    let response = self.utils.decodeResponse(data: data, type: [String].self)
                    completion(response, nil)
                }else{
                    if error != nil{
                        let error = self.utils.decodeResponse(data: data ?? Data(), type: ErrorResponseModel.self)
                        completion(nil, error)
                    }
                }
            }
    }
    
    func getPeriod(completion : @escaping(([String]? , ErrorResponseModel?)->())){
        
        networkManager.createRequests(headers: StaticHeaders.headers, baseURL: BaseURLs.baseURL, endpoint: Endpoints.getPeriod, requestMethod: .GET, params: nil) { data , error in
            if let data = data {
                let response = self.utils.decodeResponse(data: data, type: [String].self)
                completion(response, nil)
            }else{
                if error != nil{
                    let error = self.utils.decodeResponse(data: data ?? Data(), type: ErrorResponseModel.self)
                    completion(nil, error)
                }
            }
        }
    }
    
    func getTypes(completion : @escaping((HoroTypesResponseModel? , ErrorResponseModel?)->())){
        
        networkManager.createRequests(headers: StaticHeaders.headers, baseURL: BaseURLs.baseURL, endpoint: Endpoints.getTypes, requestMethod: .GET, params: nil) { data , error  in
            if let data = data {
                let response = self.utils.decodeResponse(data: data, type: HoroTypesResponseModel.self)
                completion(response,nil)
            }else{
                if error != nil{
                    let error = self.utils.decodeResponse(data: data ?? Data(), type: ErrorResponseModel.self)
                    completion(nil, error)
                }
            }
            
        }
        
    }
    
    func getHoroscope(period : String , sign : String , type : String ,completion : @escaping((HoroscopeResultResponseModel? , ErrorResponseModel?)->())){
        
        let endpoint = "\(Endpoints.getHoroscope)/\(sign)/\(period)/\(type)"
        
        networkManager.createRequests(headers: StaticHeaders.headers, baseURL: BaseURLs.baseURL, endpoint: endpoint, requestMethod: .GET, params: nil) { data, error in
            
            if let data = data {
                let response = self.utils.decodeResponse(data: data, type: HoroscopeResultResponseModel.self)
                completion(response,nil)
            }else{
                if error != nil{
                    let error = self.utils.decodeResponse(data: data ?? Data(), type: ErrorResponseModel.self)
                    completion(nil, error)
                }
            }
            
            
        }
        
    }
}
