import SwiftUI


struct CustomButton: View {
    var title: String
    var action: () -> Void
    
    var body: some View{
        Button(action: action) {
            Text(title)
        }.fontWeight(.bold)
            .foregroundColor(.white)
            .padding()
    }
}


struct MyPreviewProvider_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(title: "Preview Title"){
            print("Click en el boton")
        }
    }
}
