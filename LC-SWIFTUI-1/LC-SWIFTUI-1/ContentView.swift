import SwiftUI

struct ContentView: View {
    var body: some View {
        //VStack
        //HStack
        VStack(alignment: .leading){
            //Más componentes
            Text("Hola SwiftUI")
                .font(.title)
                .foregroundColor(.cyan)
            
            Text("VStack es un contenedor que apila las vistas en vertical. Puedes cambiar la alineación y el espacio de elementos")
                .font(.body)
                .lineLimit(nil)
                .truncationMode(.tail)
            
            Button(action: {
                print("click en el botón")
            }) {
                Text("Presiona aqui")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
            }
            .background(Color.green)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            //CustomButton(title: "Mi botón custom", action: {
                //print("Click en mi botón custom")
            //})
        }.padding()
    }
}

#Preview {
    ContentView()
}
