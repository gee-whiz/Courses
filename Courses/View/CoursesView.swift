//
//  CoursesView.swift
//  Courses
//
//  Created by George kapoya on 16.5.2020.
//  Copyright © 2020 George kapoya. All rights reserved.
//

import SwiftUI

struct CoursesView: View {

    let categoryViewModel: CategoryViewModel

    var body: some View {

        VStack(alignment: .leading) {
            Text(self.categoryViewModel.name)
                .font(.headline)
                .foregroundColor(.secondary)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 8) {
                    ForEach(self.categoryViewModel.courses, id: \.id){
                        course in

                        NavigationLink(destination: CourseDetailView(courseViewModel: course)) {
                            CourseItem(course: course)
                        }

                    }
                }
            }
        }
    }
}



struct CourseItem: View {
    let course: CourseViewModel
    var body: some View {
        VStack(alignment: .leading) {
            Image(course.imageUrl).renderingMode(.original)
                .resizable()
                .frame(height: 149)
            VStack(alignment: .leading) {
                Text(course.name).font(.headline).foregroundColor(.primary)
                Text(course.numberOfLessons)
                    .font(.caption).foregroundColor(.secondary)
            }.padding(.leading, 8)
            Spacer()
            }.frame(width: 190, height: 240)
            .cornerRadius(8)
    }
}


struct CoursesView_Previews: PreviewProvider {
    static var previews: some View {
        CoursesView(categoryViewModel: CategoryViewModel(categoryRow: CategoryRow(name: "Recommended", items: [Course(name: "Design Basics for Beginners", imageUrl: "design", lessons: [Lesson]())])))
    }
}
