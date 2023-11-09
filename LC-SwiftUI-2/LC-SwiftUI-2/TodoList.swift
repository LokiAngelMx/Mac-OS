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
            
            HStack {
                TextField("Añadir una nueva tarea", text: $newTask).textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action: {
                    if !newTask.isEmpty {
                        tasks.append(newTask)
                        newTask = ""
                    }
                }) {
                    Text("Añadir")
                }
            }.padding()
            
            List {
                ForEach(Array(tasks.enumerated()), id: \.element) {
                    index, task in
                    
                    HStack {
                        Text(task)
                        Spacer()
                        Button(action: {
                            deleteTask(at: index)
                        }, label: {
                            Label(title: {}, icon: {
                                Image(systemName: "trash").foregroundColor(.red)
                            })
                        }).buttonStyle(.plain)
                    }
                }
            }
        }
    }
    
    private func deleteTask(at index: Int) {
        tasks.remove(at: index)
    }
}

#Preview {
    TodoList()
}
