import Foundation
import SwiftUI

enum ActiveView {
    case demo1
    case demo2
    case demo3
}

struct MainView: View {
    @State var activeView: ActiveView = .demo1
    
    var body: some View {
        switch activeView {
        case .demo1:
            DemoView1(activeView: $activeView)
        case .demo2:
            DemoView2(activeView: $activeView)
        case .demo3:
            DemoView3(activeView: $activeView)
        }
    }
}

struct NavigationView1_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hello, world!")
    }
}
