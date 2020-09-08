//
//  ContentView.swift
//  Courses
//
//  Created by George kapoya on 16.5.2020.
//  Copyright © 2020 George kapoya. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject var categoriesViewModel = CategoriesViewModel()

    init() {
        UINavigationBar.appearance().tintColor = .label
    }

    var body: some View {
        NavigationView {
            List {
                ForEach(self.categoriesViewModel.categories, id: \.id) {
                    category in
                    CoursesView(categoryViewModel: category)
                }
            }.navigationBarTitle("Hi, George")
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

