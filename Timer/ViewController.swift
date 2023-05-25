//
//  ViewController.swift
//  Timer
//
//  Created by Alikhan Kopzhanov on 25.05.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "secondVC"{
            let vc = segue.destination as! SecondViewController
            
            vc.time = Int(textField.text!) ?? 0
        }
    }
    
}

