//
//  UserViewController.swift
//  project1
//
//  Created by DigitalMedia-2017 on 2018. 4. 24..
//  Copyright © 2018년 DigitalMedia-2017. All rights reserved.
//

import UIKit

class UserViewController: UIViewController, UITextFieldDelegate{
    
    @IBOutlet var footLabelDisplay: UILabel!
    @IBOutlet var textField: UITextField!
    @IBOutlet var footWidth: UISegmentedControl!
    
    var length:Int = 0
    var userName:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //delegate method
    func textFieldShouldReturn(_ textField: UITextField) -> Bool { textField.resignFirstResponder()
        userName = textField.text!
        return true
    }
    
    //발 사이즈 나타내줄 디스플레이 : 일의 자리까지 나타냄
    @IBAction func lengthDisplay(_ sender: UISlider) {
        footLabelDisplay.text=String(format:"%10.f", sender.value)
        length = Int(sender.value)
    }
    
    //다음 view로 값을 전달하기위해 준비하는 함수
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination
        destination.title = "신발 고르기"
        let destVC = segue.destination as! ShoesViewController
        destVC.name = userName
        destVC.length = self.length
        destVC.seg = footWidth.titleForSegment(at: footWidth.selectedSegmentIndex)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
