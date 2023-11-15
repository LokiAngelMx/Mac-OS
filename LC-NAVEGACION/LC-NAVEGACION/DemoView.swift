import Foundation
import SwiftUI

struct DemoView1: View {
    @Binding var activeView: ActiveView
    
    var body: some View {
        VStack {
            Text("Demo View 1")
            Button("Cambiar a View 2") {
                activeView = .demo2
            }
        }.padding().frame(minWidth: 400, minHeight: 200)
    }
}

struct DemoView2: View {
    @Binding var activeView: ActiveView
    
    var body: some View {
        VStack {
            Text("Demo View 2")
            Text("Tamaño de 500x500")
            Button("Cambiar a View 1") {
                activeView = .demo1
            }
            Button("Cambiar a View 3") {
                activeView = .demo3
            }
        }.padding().frame(minWidth: 500, minHeight: 500)
    }
}

struct DemoView3: View {
    @Binding var activeView: ActiveView
    
    var body: some View {
        VStack {
            Text("Demo View 3")
            Button("Cambiar a View 1") {
                activeView = .demo1
            }
            Button("Cambiar a View 2") {
                activeView = .demo2
            }
            Button("Abrir nueva ventana") {
                WindowUtil.openNewWindow(DemoView4(), title: "Nav Nueva Ventana", width: 200, height: 200)
            }
        }.padding().frame(minWidth: 800, minHeight: 900)
    }
}

struct DemoView4: View {
    var body: some View {
        VStack {
            Text("Ventana nueva")
        }.padding().frame(minWidth: 200, minHeight: 200)
    }
}
