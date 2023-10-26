import Foundation
import SwiftUI

struct TodoList: View {
    @State var tasks: [String] = ["Tarea 1", "Subir calificaciones", "Reprobar gente"]
    @State var newTask: String = ""
    
    var body: some View {
        VStack {
            Text("Todo list")
                .font(.title)
                .padding()
            
            List {
                ForEach(Array(tasks.enumerated()), id: \.element) {
                    index, task in
                    
                    HStack {
                        Text(task)
                    }
                }
            }
        }
    }
}

#Preview {
    TodoList()
}
