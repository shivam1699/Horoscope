//
//  Enums.swift
//  Horoscope
//
//  Created by Thinkitive on 23/10/23.
//

import Foundation
import UIKit
import SwiftUI

let width = UIScreen.main.bounds.width
let height = UIScreen.main.bounds.height

enum HTTPRequestMethod : String {
    case GET = "GET"
    case POST = "POST"
    case PATCH =  "PATCH"
    case DELETE = "DELETE"
}


enum Endpoints {

    static let getSigns = "/get_signs"
    static let getPeriod = "/get_periods"
    static let getTypes = "/get_types/today"
    static let getHoroscope = "/get_horoscope_en"
}

enum BaseURLs {
    
    static let baseURL = "https://horoscopes-ai.p.rapidapi.com"
    
}


public var apikey = "efd142184dmsh9437dde77b0d01fp1dcb2ajsne21cdb9ae249"

enum StaticHeaders {
  static var headers = [
        "X-RapidAPI-Key": apikey,
        "X-RapidAPI-Host": "horoscopes-ai.p.rapidapi.com"
    ]
}


enum Assets {
    static let appIcon =  "Horoscope-app-icon"
}

enum Colors {
    
    static let primary = Color("primary")
    static let secondary = Color("secondary")
    static let terthery = Color("terthery")
}
