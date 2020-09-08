//
//  CategoryViewModel.swift
//  Courses
//
//  Created by George kapoya on 16.5.2020.
//  Copyright © 2020 George kapoya. All rights reserved.
//

import Foundation


class CategoriesViewModel: ObservableObject {

    @Published var categories = [CategoryViewModel]()


    init() {
        getCategories()
    }

    func getCategories() {
        CourseService().fetchCategories { result in
            switch result {
            case .failure(let error):
                debugPrint(error.localizedDescription)
            case .success(let categories):
                self.categories = categories.map(CategoryViewModel.init)
            }
        }
    }
}


class CategoryViewModel {
    var categoryRow: CategoryRow

    init(categoryRow: CategoryRow) {
        self.categoryRow = categoryRow
    }

    let id = UUID()

    var name: String {
        return self.categoryRow.name
    }

    var courses: [CourseViewModel] {
        return self.categoryRow.items.map(CourseViewModel.init)
    }
}


class CourseViewModel {

    var course: Course

    init(course: Course) {
        self.course = course
    }

    let id = UUID()

    var name: String {
        return self.course.name
    }

    var imageUrl: String {
        return self.course.imageUrl
    }

    var lessons: [Lesson] {
        return self.course.lessons
    }

    var numberOfLessons: String {
        return self.lessons.count > 1 ? "\(self.lessons.count) Lessons" : "\(self.lessons.count) Lesson"
    }



}
