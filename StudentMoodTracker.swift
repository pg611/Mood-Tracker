//
//  StudentMoodTracker.swift
//  demo
//
//  Created by Student on 7/27/25.
//

import SwiftUI



struct StudentMoodTracker: View {
    @Binding var student: Student
    @State private var selectedMood = ""
    let moods = ["😊", "😢", "😡", "🤩", "😐"]
   
    var body: some View {
        VStack(spacing: 16) {
            Text("How is \(student.name) feeling?")
                .font(.title3)
           
            HStack {
                ForEach(moods, id: \.self) { mood in
                    Button {
                        selectedMood = mood
                    } label: {
                        Text(mood)
                            .font(.largeTitle)
                            .padding()
                            .background(selectedMood == mood ? Color.blue.opacity(0.3) : Color.gray.opacity(0.2))
                            .clipShape(Circle())
                    }
                }
            }
           
            Button("Save Mood") {
                let entry = MoodEntry(date: Date(), mood: selectedMood)
                student.entries.append(entry)
                selectedMood = ""
            }
            .disabled(selectedMood.isEmpty)
            .buttonStyle(.borderedProminent)
           
            List {
                ForEach($student.entries) { $entry in
                    HStack {
                        Text(entry.mood)
                        Spacer()
                        Text(entry.date.formatted(date: .omitted, time: .shortened))
                        
                        Menu {
                            ForEach(moods, id: \.self) { mood in
                                Button {
                                    entry.mood = mood
                                } label: {
                                    Text(mood)
                                }
                            }
                        } label: {
                            Image(systemName: "pencil")
                        }
                    }
                }
                .onDelete { indexSet in
                    student.entries.remove(atOffsets: indexSet)
                }
            }

                       }
        .padding()
        .navigationTitle(student.name)
    }
}

