//
//  ContentView.swift
//  ListView NightWatch
//
//  Created by Mekala Vamsi Krishna on 27/06/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var nightWatchTasks: NightWatchTasks
    @State var focusModeOn = false
    @State var  resetAlertShowing = false
    
    var body: some View {
        
        NavigationView {
            List {
                Section(header: TaskSectionHeader(symbolSystemName: "moon.stars", headerText: "Nightly Tasks")) {
                    
                    let taskIndices = nightWatchTasks.nightlyTasks.indices
                    let tasks = nightWatchTasks.nightlyTasks
                    let taskIndexPairs = Array(zip(tasks, taskIndices))
                    
                    
                    ForEach(taskIndexPairs, id:\.0.id, content: {
                        task , taskIndex in
                        
                        let nightWatchTasksWrapper = $nightWatchTasks
                        
                        let taskBinding = nightWatchTasksWrapper.nightlyTasks
                        
                        let theTasksBinding = taskBinding[taskIndex]
                        
                        if focusModeOn == false || (focusModeOn && task.isComplete == false) {
                            
                            NavigationLink(
                                destination: DetailsView(task: theTasksBinding),
                                label: {
                                    TaskRow(task: task)
                                })
                            
                        }
                
                    }).onDelete(perform: { indexSet in
                        nightWatchTasks.nightlyTasks.remove(atOffsets: indexSet)
                    })
                    .onMove(perform: { indices, newOffset in
                        nightWatchTasks.nightlyTasks.move(fromOffsets: indices, toOffset: newOffset)
                    })
                    
                }
                Section(header: TaskSectionHeader(symbolSystemName: "sunset", headerText: "Weekly Tasks")) {
                
                let taskIndices = nightWatchTasks.weeklyTasks.indices
                let tasks = nightWatchTasks.weeklyTasks
                let taskIndexPairs = Array(zip(tasks, taskIndices))
                
                
                ForEach(taskIndexPairs, id:\.0.id, content: {
                    task , taskIndex in
                    
                    let nightWatchTasksWrapper = $nightWatchTasks
                    
                    let taskBinding = nightWatchTasksWrapper.weeklyTasks
                    
                    let theTasksBinding = taskBinding[taskIndex]
                    
                    if focusModeOn == false || (focusModeOn && task.isComplete == false) {
                        NavigationLink(
                            destination: DetailsView(task: theTasksBinding),
                            label: {
                                TaskRow(task: task)
                            })
                    }
            
                    
                    
                }).onDelete(perform: { indexSet in
                    nightWatchTasks.nightlyTasks.remove(atOffsets: indexSet)
                })
                .onMove(perform: { indices, newOffset in
                    nightWatchTasks.nightlyTasks.move(fromOffsets: indices, toOffset: newOffset)
                })
            }
                Section(header: TaskSectionHeader(symbolSystemName: "calendar", headerText: "Monthly Tasks")) {
                    
                    let taskIndices = nightWatchTasks.monthlyTasks.indices
                    let tasks = nightWatchTasks.monthlyTasks
                    let taskIndexPairs = Array(zip(tasks, taskIndices))
                    
                    
                    ForEach(taskIndexPairs, id:\.0.id, content: {
                        task , taskIndex in
                        
                        let nightWatchTasksWrapper = $nightWatchTasks
                        
                        let taskBinding = nightWatchTasksWrapper.monthlyTasks
                        
                        let theTasksBinding = taskBinding[taskIndex]
                        
                        if focusModeOn == false || (focusModeOn && task.isComplete == false) {
                            NavigationLink(
                                destination: DetailsView(task: theTasksBinding),
                                label: {
                                    TaskRow(task: task)
                                })
                        }
                        
                    }).onDelete(perform: { indexSet in
                        nightWatchTasks.nightlyTasks.remove(atOffsets: indexSet)
                    })
                    .onMove(perform: { indices, newOffset in
                        nightWatchTasks.nightlyTasks.move(fromOffsets: indices, toOffset: newOffset)
                    })
                }
                
            }
            .listStyle(GroupedListStyle())
            .toolbar {
                ToolbarItem (placement: .navigationBarLeading){
                    EditButton()
                }
                ToolbarItem (placement: .navigationBarTrailing){
                    Button("Reset") {
                        resetAlertShowing = true
                    }
                }
                ToolbarItem (placement: .bottomBar){
                    Toggle(isOn: $focusModeOn, label: {
                        Text("Focus Mode")
                    })
                }

            }
            .navigationTitle("Tasks")
        }.alert(isPresented: $resetAlertShowing, content: {
            Alert(title: Text("Reset List"), message: Text("Are you sure?"), primaryButton: .cancel(), secondaryButton: .destructive(Text("Yes, Reset it"), action: {
                let refreshedNightWatchTasks = NightWatchTasks()
                self.nightWatchTasks.nightlyTasks = refreshedNightWatchTasks.nightlyTasks
                self.nightWatchTasks.weeklyTasks = refreshedNightWatchTasks.weeklyTasks
                self.nightWatchTasks.monthlyTasks = refreshedNightWatchTasks.monthlyTasks
            }))
        })
        
    }
    
}

struct TaskSectionHeader: View {
    let symbolSystemName: String
    let headerText: String
    var body: some View {
        HStack {
            Image(systemName: symbolSystemName)
            Text(headerText)
            .font(.title3)
                .foregroundColor(Color("AccentColor"))
        }
    }
}

struct TaskRow: View {
    let task: Task
    
    var body: some View {
        VStack {
            if task.isComplete {
                HStack {
                    Image(systemName: "checkmark.square")
                    Text(task.name)
                        .foregroundColor(.gray)
                        .strikethrough()
                }
                
            } else {
                HStack {
                    Image(systemName: "square")
                    Text(task.name)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let nightWatchTasks = NightWatchTasks()
        
        Group {
            ContentView(nightWatchTasks: nightWatchTasks)
            TaskRow(task: Task(name: "Test Task", isComplete: false, lastCompleted: nil))
                .previewLayout(.fixed(width: 300, height: 70))
        }
    }
}
