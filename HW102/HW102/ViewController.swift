//
//  ViewController.swift
//  HW102
//
//  Created by Азат Зиганшин on 17.09.2023.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
    }

    @IBAction func buttonPressed(_ sender: Any) {
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        performSegue(withIdentifier: "vc2", sender: nil)
        return true
    }
    
    @IBAction func unwindToViewController(_ sender: UIStoryboardSegue){
        
    }
    
}

