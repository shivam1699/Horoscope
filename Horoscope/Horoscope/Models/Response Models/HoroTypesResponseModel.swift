//
//  HoroSignsResponseModel.swift
//  Horoscope
//
//  Created by Thinkitive on 24/10/23.
//

import Foundation


struct HoroTypesResponseModel : Decodable {
    let today : [String]?
    let message : String?
}
