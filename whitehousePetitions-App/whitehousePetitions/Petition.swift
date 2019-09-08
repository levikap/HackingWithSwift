//
//  Petition.swift
//  whitehousePetitions
//
//  Created by Levi Kaplan on 8/23/19.
//  Copyright © 2019 Levi Kaplan. All rights reserved.
//

import Foundation

struct Petition: Codable {
    var title: String
    var body: String
    var signatureCount: Int
}
