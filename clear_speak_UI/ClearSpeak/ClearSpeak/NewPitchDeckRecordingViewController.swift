//
//  NewPitchDeckRecordingViewController.swift
//  ClearSpeak
//
//  Created by Yunkai Sun on 4/6/19.
//  Copyright © 2019 daniel.sun. All rights reserved.
//

import UIKit

class NewPitchDeckRecordingViewController: UIViewController {

    @IBOutlet weak var startStopBtn: UIButton!
    @IBOutlet weak var listenBtn: UIButton!
    @IBOutlet weak var redoBtn: UIButton!
    @IBOutlet weak var analyzeBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        startStopBtn.applyDesign()
        listenBtn.applyDesign()
        redoBtn.applyDesign()
        analyzeBtn.applyDesign()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
