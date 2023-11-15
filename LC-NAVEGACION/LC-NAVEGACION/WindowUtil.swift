import Foundation
import SwiftUI

class WindowUtil {
    
    static func openNewWindow(_ view: some View, title: String, width: Int, height: Int) {
        let newWindow = NSWindow(contentRect: NSRect(x: 20, y: 20, width: width, height: height), styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView], backing: .buffered, defer: false)
        newWindow.center()
        newWindow.setFrameAutosaveName(title)
        newWindow.contentView = NSHostingView(rootView: view)
        newWindow.makeKeyAndOrderFront(nil)
    }
}
