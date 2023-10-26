import Foundation
import SwiftUI

struct FormView: View {
    @State var name: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State var progress: Float = 0.0
    @State var inputs: [Bool] = [false, false, false]
    private var padding = EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0)
    
    var body: some View {
        VStack {
            Text("Registro")
                .font(.title)
            
            ProgressView(value: $progress.wrappedValue)
            
            TextField("Nombre", text: $name, onEditingChanged: { _ in
                if $name.wrappedValue.isEmpty {
                    $inputs.wrappedValue[0] = false
                } else {
                    $inputs.wrappedValue[0] = true
                }
                changeProgress()
            })
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(padding)
            
            TextField("Correo electrónico", text: $email, onEditingChanged: { _ in
                if $email.wrappedValue.isEmpty {
                    $inputs.wrappedValue[1] = false
                } else {
                    $inputs.wrappedValue[1] = true
                }
                changeProgress()
            })
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(padding)
            
            SecureField("Contraseña", text: $password, onCommit: {
                if $password.wrappedValue.isEmpty {
                    $inputs.wrappedValue[2] = false
                } else {
                    $inputs.wrappedValue[2] = true
                }
                changeProgress()
            })
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(padding)
            
            Button(action: {}) {
                Text("Registrarme").padding()
            }
            Spacer()
            
        }.padding()
    }
    
    func changeProgress() {
        $progress.wrappedValue = 0.0
        for input in $inputs {
            if input.wrappedValue {
                $progress.wrappedValue += 0.3333
            }
        }
    }
}

#Preview {
    FormView()
}
