//
//  ViewController.swift
//  PreprocessorFlagsTest
//
//  Created by skrr on 03.04.19.
//  Copyright © 2019 mic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var centeredLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    #if ALPHA
    centeredLabel.text = "IT'S ALPHA 👷‍♂️"
    
    #elseif BETA
    centeredLabel.text = "IT'S BETA 🤠"
    
    #elseif FINAL
    centeredLabel.text = "IT'S FINAL 🎉"

    #endif
    
  }


}

