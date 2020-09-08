//
//  Lesson.swift
//  Courses
//
//  Created by George kapoya on 16.5.2020.
//  Copyright © 2020 George kapoya. All rights reserved.
//

import Foundation

struct Lesson: Codable {
    let id = UUID()
    let name: String
    let description: String
    let videoUrl: String
}
