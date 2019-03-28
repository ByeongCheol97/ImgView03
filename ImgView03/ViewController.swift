//
//  ViewController.swift
//  ImgView03
//
//  Created by D7703_13 on 2019. 3. 28..
//  Copyright © 2019년 personel team. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imgview: UIImageView!
    @IBOutlet weak var label: UILabel!
    var count = 0
    var isAnimating = false
    //Timer 객체생성
    var myTimer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        imgview.image = UIImage(named: "Image\(count)")
        label.text = String(count)
    }

    @IBAction func playbtn(_ sender: Any) {
        print("playbtn")
        //Timer 작동
        if isAnimating == false {
            myTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(doAnimation), userInfo: nil, repeats: true)
            isAnimating = true
        }else {
            myTimer.invalidate()
            isAnimating = false
        }
    }
    @IBAction func pausebtn(_ sender: Any) {
        myTimer.invalidate()
    }
    @IBAction func stopbtn(_ sender: Any) {
        myTimer.invalidate()
        count = 0
    }
    
    @objc func doAnimation() {
        if count == 5 {
            count = 0
        }
        count += 1
        
        imgview.image = UIImage(named: "Image\(count)")
        label.text = String(count)
    }
}

