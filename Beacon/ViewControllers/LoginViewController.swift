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
    @IBOutlet weak var textField: UILabel!
    
    let arrayString = ["Navigate throught the office and particulare rooms",
                    "What kitchen has to offer",
                    "See where your coligues are",
                    "Many other helpful clues"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        name.delegate = self
        
        textField.attributedText = addText(stringList: arrayString, bullet: "•")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    func addText(stringList: [String], bullet: String, indentation: CGFloat = 5, lineSpacing: CGFloat = 2, paragraphSpacing: CGFloat = 12) -> NSAttributedString {
        
        let paragraphStyle = NSMutableParagraphStyle()
        let nonOptions = [NSTextTab.OptionKey: Any]()
        paragraphStyle.tabStops = [
            NSTextTab(textAlignment: .left, location: indentation, options: nonOptions)]
        paragraphStyle.defaultTabInterval = indentation
        paragraphStyle.lineSpacing = lineSpacing
        paragraphStyle.paragraphSpacing = paragraphSpacing
        paragraphStyle.headIndent = indentation
        
        let bulletList = NSMutableAttributedString()
        for string in stringList {
            let formattedString = "\(bullet)\t\(string)\n"
            let attributedString = NSMutableAttributedString(string: formattedString)
            
            attributedString.addAttributes(
                [NSAttributedStringKey.paragraphStyle : paragraphStyle],
                range: NSMakeRange(0, attributedString.length))
        
            bulletList.append(attributedString)
        }
        
        return bulletList
    }
    
}
