import Foundation
import SwiftUI

struct CalculatorButton: View {
    var action: () -> Void
    var title: String
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 32))
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(width: 80, height: 80)
        }
        .background(Color.gray)
        .clipShape(Circle())
    }
}

struct ButtonRow: View {
    var titles: [String]
    var action: (String) -> Void
    
    var body: some View {
        HStack {
            ForEach(Array(titles.enumerated()), id: \.element) {index, title in CalculatorButton(action: {}, title: title)
            }
        }
    }
}

struct CalculatorView: View {
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("0").font(.system(size: 64)).padding()
            }
            ButtonRow(titles: ["7", "8", "9", "/"], action: clickBoton)
            ButtonRow(titles: ["4", "5", "6", "X"], action: clickBoton)
            ButtonRow(titles: ["1", "2", "3", "-"], action: clickBoton)
            ButtonRow(titles: ["0", ".", "=", "+"], action: clickBoton)
        }
    }
    
    func clickBoton(_ title: String) {}
}

#Preview {
    CalculatorView()
}
