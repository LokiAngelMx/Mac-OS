import Cocoa

class ModalSheetViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func closeModal(_ sender: Any) {
        self.view.window?.close()
    }
}
