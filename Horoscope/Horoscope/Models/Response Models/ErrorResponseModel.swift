//
//  ErrorResponseModel.swift
//  Horoscope
//
//  Created by Thinkitive on 24/10/23.
//

import Foundation

struct ErrorResponseModel : Decodable {
    var message : String?
    var status : String?
    var statusCode : String?
}
