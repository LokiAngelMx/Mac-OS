import Cocoa

class MainViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func changeName(_ sender: Any) {
        if let modalSheetName = self.storyboard?.instantiateController(withIdentifier: "sheetViewName") as? SheetNameController {
            self.presentAsSheet(modalSheetName)
        }
    }
}
