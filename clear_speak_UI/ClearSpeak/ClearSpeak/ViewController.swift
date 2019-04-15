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
        signInBtn.backgroundColor = UIColor.gray
        signInBtn.layer.cornerRadius = 7
        signInBtn.setTitleColor(UIColor.white, for: .normal)
        
        signInBtn.layer.shadowColor = UIColor.gray.cgColor
        signInBtn.layer.shadowRadius = 6
        signInBtn.layer.shadowOpacity = 0.5
        signInBtn.layer.shadowOffset = CGSize(width: 0, height: 0)
        
        
    }


}

