//
//  ViewController.swift
//  appCalculo
//
//  Created by Pierre Juarez U. on 3/01/23.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardUp), name: UIResponder.keyboardWillShowNotification, object: nil)
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardDown), name: UIResponder.keyboardWillHideNotification, object: nil)
    
  }

  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    view.endEditing(true) // Close when touching outside the keyboard
  }
  
  @objc func keyboardUp(){
    let sizeScreen = UIScreen.main.nativeBounds.height
    if sizeScreen <= 2556 { // Applies only to iPhone, not iPad
      if self.view.frame.origin.y == 0 {
        self.view.frame.origin.y = -70
      }
    }
    
  }
  
  @objc func keyboardDown(){
    if self.view.frame.origin.y != 0 {
      self.view.frame.origin.y = 0
    }
  }


}

