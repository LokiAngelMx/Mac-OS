import SwiftUI

struct ConfigView: View {
    @Binding var word: String
    var saveAction: () -> Void
    
    var body: some View {
        VStack {
            Text("Ingresa la palabra:")
            TextField("", text: $word).textFieldStyle(RoundedBorderTextFieldStyle())
            Button("Guardar", action: saveAction)
        }.padding()
    }
}

struct ContentView: View {
    @State private var images = ["h1", "h2", "h3", "h4", "h5", "h6", "h7"]
    @State private var currentGuess = ""
    @State private var game = HangmanGame(word: "Machupichu", maxAttemps: 6)
    @State private var newWord = ""
    @State private var showConfig = false
    
    var body: some View {
        HStack {
            Spacer()
            Image(images[game.currentAttempts]).resizable().scaledToFit().frame(height: 250)
            Spacer()
        }.padding().background(Color.white)
        
        VStack(spacing: 20) {
            Text(game.maskedWord).font(.largeTitle)
            
            TextField("Ingresa una letra", text: $currentGuess).textFieldStyle(RoundedBorderTextFieldStyle()).onChange(of: currentGuess) { _, newValue in
                
                if let letter = newValue.last {
                    game.guess(letter: letter)
                    currentGuess = ""
                }
            }.disabled(game.status != .ongoing)
            
            Text("Intentos restantes: \(game.maxAttempts - game.currentAttempts)").foregroundStyle(game.status == .lost ? .red : .primary)
            
            switch game.status {
            case .won:
                Text("¡Ganaste!").foregroundStyle(.green)
            case .lost:
                Text("Perdiste. La palabra era: \(game.word)")
            default:
                EmptyView()
            }
            
            HStack {
                Button(action: {
                    showConfig = true
                }) {
                    Image(systemName: "gearshape.fill").resizable().frame(width: 12, height: 12)
                }.popover(isPresented: $showConfig) {
                    ConfigView(word: $newWord) {
                        game = HangmanGame(word: newWord, maxAttemps: 6)
                        showConfig = false
                    }
                }
            }
        }.padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
    }
}

#Preview {
    ContentView()
}
