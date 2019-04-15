//
//  ViewController.swift
//  ClearSpeak
//
//  Created by Yunkai Sun on 4/6/19.
//  Copyright © 2019 daniel.sun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var signInBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        signInBtn.applyDesign()
    }
}

extension UIButton{
    func applyDesign(){
        self.backgroundColor = UIColor.white
        self.layer.cornerRadius = 10
        self.setTitleColor(UIColor.black, for: .normal)
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowRadius = 6
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.borderWidth = 0.8
    }
}
