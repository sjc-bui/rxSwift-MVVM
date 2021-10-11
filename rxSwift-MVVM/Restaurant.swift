//
//  Restaurant.swift
//  rxSwift-MVVM
//
//  Created by quan bui on 2021/10/11.
//

import UIKit

class Restaurant: Codable {
    let name: String
    let cuisine: Cuisine
}

enum Cuisine: String, Codable {
    case european
    case indian
    case french
    case mexican
    case english
}
