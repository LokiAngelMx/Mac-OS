import Cocoa

class DashboardViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func showModal(_ sender: Any) {
        if let modalView = self.storyboard?.instantiateController(withIdentifier: "modalView") as? ModalViewController {
            self.presentAsModalWindow(modalView)
        }
    }
    
    @IBAction func showSheetModal(_ sender: Any) {
        if let modalSheet = self.storyboard?.instantiateController(withIdentifier: "sheetView") as? ModalSheetViewController {
            self.presentAsSheet(modalSheet)
        }
    }
}
