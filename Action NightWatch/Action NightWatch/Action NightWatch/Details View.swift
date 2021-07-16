//
//  DetailsView.swift
//  ListView NightWatch
//
//  Created by Mekala Vamsi Krishna on 28/06/21.
//

import SwiftUI

struct DetailsView: View {
    @Binding var task: Task
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    var body: some View {
        VStack {
            Image("Floor Plan")
                .resizable()
                .aspectRatio(contentMode: .fill)
            
            Text(task.name)
            if verticalSizeClass == .regular {
                
                Divider()
                Text("My name is MEKALA VAMSI KRISHNA. Iam studying B.Tech first year by learning swift and ios development parallely. This is a paragraph, to check weather the app is working or not by rotating the device.")
                Divider()
               
            }
           
            }
        Button("Mark Complete") {
            task.isComplete = true
        }
    }
}
struct DetailsView_Previews: PreviewProvider {
    static var previews: some   View {
        DetailsView(task: Binding<Task>.constant(Task(name: "Test Task", isComplete: false, lastCompleted: nil)))
            .previewLayout(.fixed(width: /*@START_MENU_TOKEN@*/667.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/375.0/*@END_MENU_TOKEN@*/))
    }
}
