//
//  LogService.swift
//  Horoscope
//
//  Created by Thinkitive on 23/10/23.
//

import Foundation

class LogService {
    
    let utils = UtilityFunctions()
    
    public func printLog(_ log: String) {
//        if EnvironmentConstants.currentEnvironment != .PROD {
            print(log)
//        }
    }
    
    let spacer = "\n \n"
    
    func printRESTRequestLogs(uid: String, method: HTTPRequestMethod, url: String, params: [String:String]?, headers: [String:String], body: Data?) {
        
        printLog(spacer)
        printLog("REQUEST------------------------------>>")
        
        printLog("UID: \(uid)")
        
        printLog("Method: \(method)")
        
        printLog("Path:\n    \(url)")
        printLog(spacer)
        
        if let params = params {
            printLog("Params:\n    \(params)")
            printLog(spacer)
        }
        
        if headers != [:] {
            printLog("Headers:\n    \(headers)")
            printLog(spacer)
        }
        
        if let body = body {
            let request = utils.nsdataToJSON(data: body)
            if let request = request {
                printLog("Body:\n    \(request)")
                printLog(spacer)
            }
        }
        
    }
    
    func printRESTResponseLogs(uid: String, method: HTTPRequestMethod, url: String, response: Data?, error: Error?) {
        
        printLog(spacer)
        printLog("<<------------------------------RESPONSE")
        
        printLog("UID: \(uid)")
        
        printLog("Method: \(method)")
        
        printLog("Path:\n    \(url)")
        
        if let response = utils.nsdataToJSON(data: response) {
            printLog("Response:\n\(response)")
            printLog(spacer)
        }
        
        if let error = error {
            printLog("Error:\n \(error)")
            printLog(spacer)
        }
        
    }
    
}



