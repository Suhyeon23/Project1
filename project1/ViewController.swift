//
//  ViewController.swift
//  project1
//
//  Created by DigitalMedia-2017 on 2018. 4. 23..
//  Copyright © 2018년 DigitalMedia-2017. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    @IBOutlet var imageDisplay: UIImageView!
    
    //이미지뷰에 나타낼 이미지들 변수
    let notice1 = UIImage(named: "one.png")
    let notice2 = UIImage(named: "two.png")
    let notice3 = UIImage(named: "three.png")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //세그먼트 컨트롤이 바뀔때마다 그에 맞는 이미지로 변경됨
    @IBAction func segControlDisplay(_ sender: UISegmentedControl) {
        if(sender.titleForSegment(at: sender.selectedSegmentIndex) == "1")
            {imageDisplay.image = notice1}
        else if(sender.titleForSegment(at: sender.selectedSegmentIndex) == "2")
            {imageDisplay.image = notice2}
        else if(sender.titleForSegment(at: sender.selectedSegmentIndex) == "3")
            {imageDisplay.image = notice3}
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { let destination = segue.destination
        let button = sender as! UIButton
        destination.title = button.titleLabel?.text
    }


}

