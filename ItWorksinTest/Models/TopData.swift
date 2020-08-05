//
//  TopData.swift
//  ItWorksinTest
//
//  Created by Igor Karyi on 05.08.2020.
//  Copyright © 2020 Igor Karyi. All rights reserved.
//

import Foundation

struct TopData {
    var section: String
    var data: [TopModel]
}

struct TopModel {
    var countLikes: Int
    var bigImage: String
    var smallImage: String
    var number: String
    var title: String
    var fullName: String
}
