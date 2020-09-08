//
//  Course.swift
//  Courses
//
//  Created by George kapoya on 16.5.2020.
//  Copyright © 2020 George kapoya. All rights reserved.
//

import Foundation

struct Course: Codable {

    let name: String
    let imageUrl: String
    let lessons: [Lesson]
}
