//
//  UtilityFunctions.swift
//  Horoscope
//
//  Created by Thinkitive on 24/10/23.
//

import Foundation


class UtilityFunctions {
    
    func nsdataToJSON(data: Data?) -> AnyObject? {
        
        guard let data = data else {
            return nil
        }
        
        do {
            return try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as AnyObject
        } catch let myJSONError {
            print(myJSONError)
        }
        return nil
    }
    
    func decodeResponse<T:Decodable>(data: Data, type: T.Type) -> T? {
        
        var response:T?
        do {
            response = try JSONDecoder().decode(T.self, from: data)
        } catch {
            printError(error: error, string: nil)
        }
        
        return response
        
    }
    
    func printError(error: Error?, string: String?) {
        
        print("CAUGHT WITH AN ERROR:\n\n")
        if let error = error {
            print(error)
        }
        if let string = string {
            print(string)
        }
        
    }
    
}
