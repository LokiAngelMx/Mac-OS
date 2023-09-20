import Cocoa

class ModalMailController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func sentMail(_ sender: Any) {
        if let modalSheetCode = self.storyboard?.instantiateController(withIdentifier: "sheetViewCode") as? sheetCodeController {
            self.presentAsSheet(modalSheetCode)
        }
    }
}
