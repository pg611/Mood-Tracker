//
//  ContentView.swift
//  demo
//
//  Created by Student on 7/27/25.
//



//DEMO day2
import SwiftUI
struct ContentView: View {
    @State private var students: [Student] = []
   
    var body: some View {
        TabView {
            StudentLogView(students: $students)
                .tabItem {
                    Label("Log Mood", systemImage: "person")
                }
           
            ClassSummaryView(students: students)
                .tabItem {
                    Label("Summary", systemImage: "chart.bar")
                }
        }
    }
}



#Preview {
    ContentView()
}
