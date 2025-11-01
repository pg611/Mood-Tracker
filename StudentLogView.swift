//
//  StudentLogView.swift
//  demo
//
//  Created by Student on 10/31/25.
//

import SwiftUI

struct StudentLogView: View {
    @Binding var students: [Student]
    @State private var newName: String = ""
    @State private var selectedStudent: Student?
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(students) { student in
                        NavigationLink(destination: StudentMoodTracker(student: binding(for: student))) {
                            HStack {
                                Text(student.emoji)
                                Text(student.name)
                            }
                        }
                    }
                }
               
                HStack {
                    TextField("Enter name", text: $newName)
                        .textFieldStyle(.
roundedBorder)

                    Button("Add") {
                        guard !newName.isEmpty else { return }
                        students.append(Student(name: newName, emoji: "🙂"))
                        newName = ""
                    }
                }
                .padding()
            }
            .navigationTitle("Students")
        }
    }
   
    func binding(for student: Student) -> Binding<Student> {
        guard let index = students.firstIndex(where: { $0.id == student.id }) else {
            fatalError("Student not found")
        }
        return $students[index]
    }
}



