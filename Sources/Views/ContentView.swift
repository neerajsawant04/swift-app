import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = TaskViewModel()
    @State private var newTaskTitle: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                // Input field for new task
                HStack {
                    TextField("Enter task", text: $newTaskTitle)
                        .padding(10)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                    
                    Button(action: {
                        guard !newTaskTitle.isEmpty else { return }
                        viewModel.addTask(title: newTaskTitle)
                        newTaskTitle = ""
                    }) {
                        Text("Add")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }
                .padding()
                
                // List of tasks
                List {
                    ForEach(viewModel.tasks) { task in
                        TaskRow(task: task) {
                            viewModel.toggleTaskCompletion(task: task)
                        }
                    }
                    .onDelete(perform: viewModel.deleteTask)
                }
                .listStyle(InsetGroupedListStyle())
            }
            .navigationTitle("To-Do List")
            .toolbar {
                EditButton()
            }
        }
    }
}