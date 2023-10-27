//
//  HoroscopeResultDataModel.swift
//  Horoscope
//
//  Created by Thinkitive on 24/10/23.
//

import Foundation

struct HoroscopeResultDataModel : Identifiable {
    
    var id = UUID()
    let sign : String?
    let period : String?
    let language : String?
    let general : [String?]?
    let love : [String?]?
    let career : [String?]?
    let wellness : [String?]?
}
