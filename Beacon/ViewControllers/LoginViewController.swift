//
//  MainView.swift
//  Beacon
//
//  Created by user1 on 27.07.2018.
//  Copyright © 2018 user1. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var textYouCan: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        name.delegate = self
        
        bulletPointList()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func bulletPointList(){
        
            textYouCan.text = "• Navigate throught the office and particulare rooms\n"
                            + "• What kitchen has to offer\n"
                            + "• See where your coligues are\n"
                            + "• Many other helpful clues"
        
    }
    
}
