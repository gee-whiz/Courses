//
//  CoursesServices.swift
//  Courses
//
//  Created by George kapoya on 16.5.2020.
//  Copyright © 2020 George kapoya. All rights reserved.
//

import Foundation

enum CourseError: Error {
    case errorLoading(_ message: String)
}

class CourseService {

    func fetchCategories(completion: @escaping (Result<[CategoryRow], Error>) -> Void) {

        let bundle = Bundle(for: type(of: self))

        guard let url = bundle.url(forResource: "MockData", withExtension: "json") else {
            completion(.failure(CourseError.errorLoading("Error reading from file")))
            return
        }

        do {
           let jsonData = try Data(contentsOf: url)
            let categories = try JSONDecoder().decode([CategoryRow].self, from: jsonData)
            completion(.success(categories))
        } catch {
            completion(.failure(error))
        }

    }
}
