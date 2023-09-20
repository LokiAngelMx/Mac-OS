import Cocoa

class ModalMailController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func sentMail(_ sender: Any) {
        if let modalViewMail = self.storyboard?.instantiateController(withIdentifier: "modalView") as? ModalCodeController {
            self.presentAsModalWindow(modalViewMail)
        }
    }
}
