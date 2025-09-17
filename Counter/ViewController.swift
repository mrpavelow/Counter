import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        counterView.text = "\(counter)"
        logTextView.text = logArray[0]
    }
    
    private func updateCounter() {
        counterView.text = "\(counter)"
    }
    
    private func extendNumber() {
        counter += 1
        updateCounter()
    }
    
    @IBOutlet weak private var counterView: UILabel!
    private var counter = 0
    
    @IBAction private func resetButtonDidTap(_ sender: Any) {
        if counter > 0 {
            counter = 0
            updateCounter()
            makeALog(outputMessage: ": значение сброшено")
        }
    }
    
    @IBAction private func counterButtonDidTap(_ sender: UIButton) {
        extendNumber()
        makeALog(outputMessage: ": значение изменено на +1")
    }
    @IBAction private func plusButtonDidTap(_ sender: Any) {
        extendNumber()
        makeALog(outputMessage: ": значение изменено на +1")
    }
    @IBAction private func minusButtonDidTap(_ sender: Any) {
        if counter >= 1 {
            counter -= 1
            updateCounter()
            makeALog(outputMessage: ": значение изменено на -1")
        }
        else {
            makeALog(outputMessage: ": попытка уменьшить значение счётчика ниже 0")
        }
    }

    @IBOutlet weak private var logTextView: UITextView!
        
    private var logArray: [String] = ["История изменений:"]
    
    private func makeALog(outputMessage: String) {
        let today = Date.now
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMM yyyy HH:mm:ss"
        let dateLine = (formatter.string(from: today))
  
        let newLine = (dateLine + "\(outputMessage)")
        logArray.append(newLine)
        logTextView.text = logArray.joined(separator: "\n")
    }
}


