import SwiftUI

struct TaskRow: View {
    let task: Task
    var toggleCompletion: () -> Void
    
    var body: some View {
        HStack {
            Button(action: toggleCompletion) {
                Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(task.isCompleted ? .green : .gray)
            }
            Text(task.title)
                .strikethrough(task.isCompleted, color: .gray)
                .foregroundColor(.primary)
                .padding()
            Spacer()
        }
        .padding(.vertical, 4)
    }
}