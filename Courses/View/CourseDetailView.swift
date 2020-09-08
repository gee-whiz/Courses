//
//  CourseDetailView.swift
//  Courses
//
//  Created by George kapoya on 16.5.2020.
//  Copyright © 2020 George kapoya. All rights reserved.
//

import SwiftUI

struct CourseDetailView: View {
    let courseViewModel: CourseViewModel

    @State var showAVPlayer = false

    var body: some View {
       return List {

            Image(courseViewModel.imageUrl).resizable()
                .scaledToFit().listRowInsets(EdgeInsets())
            VStack(alignment: .leading) {
                Text(courseViewModel.name).font(.largeTitle).fontWeight(.bold).foregroundColor(.primary)
                Divider()
                Text("Curriculum")
                    .foregroundColor(.secondary).font(.headline)
                ForEach(courseViewModel.lessons, id: \.id) {
                    lesson in
                    LessonItem(lesson: lesson)
                        .padding().onTapGesture {
                            self.showAVPlayer = true
                    }.sheet(isPresented: self.$showAVPlayer) {
                        AvPlayerView(videoUrl: URL(string: lesson.videoUrl)).edgesIgnoringSafeArea(.all)
                    }

                }
                .navigationBarTitle(Text(courseViewModel.name), displayMode: .inline)
            }

        }
    }
}


struct LessonItem: View {
    let lesson: Lesson
    var body: some View {
        HStack {
            VStack{
                Image(systemName: "play.fill").foregroundColor(.white)
            }.frame(width: 50, height: 50).background(Color.orange).cornerRadius(10)
            VStack(alignment: .leading) {
                Text(lesson.name).font(.headline).foregroundColor(.primary)
                Text(lesson.description).font(.subheadline).foregroundColor(.secondary)
            }.padding(.horizontal)                    }
    }
}

struct CourseDetailView_Previews: PreviewProvider {
    static var previews: some View {
           CourseDetailView(courseViewModel: CourseViewModel(course: Course(name: "Design Basics for Beginners", imageUrl: "design", lessons: [Lesson(name: "Indroduction", description: "Lorem Ipsum is simply dummy text of the printing and typesetting", videoUrl: "")])))
    }
}

