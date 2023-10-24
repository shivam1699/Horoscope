//
//  Enums.swift
//  Horoscope
//
//  Created by Thinkitive on 23/10/23.
//

import Foundation

enum HTTPRequestMethod : String {
    case GET = "GET"
    case POST = "POST"
    case PATCH =  "PATCH"
    case DELETE = "DELETE"
}


enum Endponts {

    static let getSigns = "/get_signs"
}

enum BaseURLs {
    
    static let baseURL = "https://horoscopes-ai.p.rapidapi.com"
    
}


enum StaticHeaders {
  static let headers = [
        "X-RapidAPI-Key": "efd142184dmsh9437dde77b0d01fp1dcb2ajsne21cdb9ae249",
        "X-RapidAPI-Host": "horoscopes-ai.p.rapidapi.com"
    ]
}
