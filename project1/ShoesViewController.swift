//
//  ShoesViewController.swift
//  project1
//
//  Created by DigitalMedia-2017 on 2018. 4. 25..
//  Copyright © 2018년 DigitalMedia-2017. All rights reserved.
//

import UIKit

class ShoesViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet var pickerShoes: UIPickerView!
    @IBOutlet var labelInfo: UILabel!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    @IBOutlet var viewHidden: UIView!
    @IBOutlet var viewHidden2: UIView!
    @IBOutlet var labelFit: UILabel!
    @IBOutlet var recommend: UILabel!
    
    //picker view에 들어갈 데이터
    let modelArray: Array<String> = ["아디다스A", "아디다스B"]
    let sizeArray: [String] = ["230", "240", "250"]
    
    //user view에서 값을 전달받기위한 변수들
    var name: String!
    var length: Int?
    var model:String!
    var size:Int!
    var seg:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewHidden.isHidden = true
        viewHidden2.isHidden = true
    }
    
    //picker view에 필요한 함수들
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return modelArray.count }
        else {
            return sizeArray.count }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return modelArray[row] }
        else {
            return sizeArray[row] }
    }
    
    //picker view에서 선택한 신발 재확인 + activityIndicator 작동
    @IBAction func getInfo(_ sender: UIButton) {
        model = modelArray[self.pickerShoes.selectedRow(inComponent: 0)]
        size = (Int)(sizeArray[self.pickerShoes.selectedRow(inComponent: 1)])
        viewHidden.isHidden = false
        labelInfo.text = model + " " + ((String)(size)) + "를 선택하셨습니다. "
        activityIndicator.startAnimating()
    }
    
    //고른 신발과 사용자의 매칭결과
    @IBAction func fitInfo(_ sender: UIButton) {
        if activityIndicator.isAnimating{           //activityIndicator이 작동할때만 결과 확인 가능
            
            activityIndicator.stopAnimating()
            viewHidden2.isHidden = false
            
            //아디다스A 모델을 선택한 경우 : 길이 보통, 넓이 크게 나옴
            if (model == "아디다스A"){
                
                //길이가 맞는 경우
                if ((size-4) < length!) && (length! < (size+7)){
                    labelFit.text = name + " 님께 길이와 발볼 모두 잘 맞아서"
                    recommend.text = "매우 추천합니다."
                }
                
                //길이가 맞지 않는 경우
                else{
                    //신발 전체 사이즈에 대해 발길이가 너무 짧거나 긴 경우
                    if(226 > length!) || (length! > 256){
                        recommend.text = "추천하지 않습니다."
                        labelFit.text = name + " 님께 맞는 길이가 없어서 "}
                    
                    //선택한 사이즈가 발길이와 안맞을뿐, 맞는 사이즈가 존재하는 경우
                    else{
                    recommend.text = "추천하지 않습니다."
                    labelFit.text = name + " 님께 길이가 맞지않아 "
                    }
                }
            }
            
            //아디다스B 모델을 선택한 경우 : 길이 작음, 넓이 보통으로 나옴
            if (model == "아디다스B"){
                
                //길이가 맞는 경우
                if ((size-10 < length!) && (length! <= size)){
                    
                    //발볼이 넓은 경우
                    if seg=="넓음" {
                        labelFit.text = name + " 님께 길이는 맞으나 발볼이 작을 수 있어 "
                        recommend.text = "그닥 추천하지 않습니다."
                        
                    }
                        
                    //발볼이 좁읍 또는 보통일 경우
                    else{
                        labelFit.text = name + " 님께 길이와 발볼 모두 잘 맞아서"
                        recommend.text = "매우 추천합니다."
                    }
                }
                    
                //길이가 맞지 않는 경우
                else {
                    
                    //신발 전체 사이즈에 대해 발길이가 너무 짧거나 긴 경우
                    if(221 > length! || length! > 250){
                        recommend.text = "추천하지 않습니다."
                        labelFit.text = name + " 님께 맞는 길이가 없어서 "
                    }
                        
                    //선택한 사이즈가 발길이와 안맞을뿐, 맞는 사이즈가 존재하는 경우
                    else{
                        recommend.text = "추천하지 않습니다."
                        labelFit.text = name + " 님께 길이가 맞지않아 "
                    }
                }
            }
        }
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
