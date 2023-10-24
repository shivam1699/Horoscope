//
//  HoroscopeResultResponseModel.swift
//  Horoscope
//
//  Created by Thinkitive on 24/10/23.
//

import Foundation

struct HoroscopeResultResponseModel : Decodable {
    let sign : String?
    let period : String?
    let language : String?
    let general : [String?]
}
