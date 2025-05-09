//
//  ViewController.swift
//  counter-app
//
//  Created by Mikhail Pavlov on 08.05.2025.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        counterView.text = "\(counter)"
        logTextView.text = logArray[0]
        // Do any additional setup after loading the view.
    }
    
    func updateCounter() {
        counterView.text = "\(counter)"
    }
    
    func extendNumber() {
        counter += 1
        updateCounter()
    }
    
    @IBOutlet weak var counterView: UILabel!
    var counter = 0
    
    @IBAction func resetButtonDidTap(_ sender: Any) {
        if counter > 0 {
            counter = 0
            updateCounter()
            makeALog(outputMessage: ": значение сброшено")
        }
    }
    
    @IBAction func counterButtonDidTap(_ sender: UIButton) {
        extendNumber()
        makeALog(outputMessage: ": значение изменено на +1")
    }
    @IBAction func plusButtonDidTap(_ sender: Any) {
        extendNumber()
        makeALog(outputMessage: ": значение изменено на +1")
    }
    @IBAction func minusButtonDidTap(_ sender: Any) {
        if counter >= 1 {
            counter -= 1
            updateCounter()
            makeALog(outputMessage: ": значение изменено на -1")
        }
        else {
            makeALog(outputMessage: ": попытка уменьшить значение счётчика ниже 0")
        }
    }

    @IBOutlet weak var logTextView: UITextView!
        
    var logArray: [String] = ["История изменений:"]
    
    func makeALog(outputMessage: String) {
        let today = Date.now
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMM yyyy HH:mm:ss"
        let dateLine = (formatter.string(from: today))
  
        let newLine = (dateLine + "\(outputMessage)")
        logArray.append(newLine)
        logTextView.text = logArray.joined(separator: "\n")
    }
}


