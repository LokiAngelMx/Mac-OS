import Foundation
import SwiftUI

struct MainView: View {
    @State private var showContentView = false
    @State private var showExitConfirmation = false

    var body: some View {
        VStack {
            Button("Iniciar") {
                showContentView = true
            }
            .sheet(isPresented: $showContentView) {
                ContentView().environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
            }
            
            Button("Salir") {
                showExitConfirmation = true
            }
            .alert(isPresented: $showExitConfirmation) {
                Alert(
                    title: Text("Confirmación"),
                    message: Text("¿Deseas cerrar la ventana?"),
                    primaryButton: .destructive(Text("Salir")) {
                        NSApp.terminate(nil)
                    },
                    secondaryButton: .cancel()
                )
            }
        }
    }
}
