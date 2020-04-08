//
//  ViewController.swift
//  2020_0323_test
//
//  Created by tjoeun304 on 2020/03/23.
//  Copyright © 2020 tjoeun304. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UIPickerViewDelegate, UIPickerViewDataSource{
    
    let lottoArray: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10,
                                11, 12, 13, 14, 15, 16, 17, 18, 19, 20,
                                21, 22, 23, 24, 25, 26, 27, 28, 29, 30,
                                31, 32, 33, 34, 35, 36, 37, 38, 39, 40,
                                41, 42, 43, 44, 45, 1, 2, 3, 4, 5]
    
    var timer:Timer? = nil
    let timerSelector:Selector = #selector(ViewController.updateTime)
    

    @IBOutlet weak var lblShowNum: UILabel!
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pickerView.delegate = self
        pickerView.dataSource = self 
        
    }
    
    //회전 돌리고 값 넣기
    @IBAction func onClickStart(_ sender: UIButton) {
       count1 = Int(arc4random()%7 + 6) + 100
       count2 = Int(arc4random()%7 + 12) + 100
       count3 = Int(arc4random()%7 + 18) + 100
       count4 = Int(arc4random()%7 + 24) + 100
       count5 = Int(arc4random()%7 + 30) + 100
       count6 = Int(arc4random()%7 + 36) + 100

    
        timerStart()
        
    }
    
    var count1 = 0
    var count2 = 0
    var count3 = 0
    var count4 = 0
    var count5 = 0
    var count6 = 0
    

    
    //Timer Start
    func timerStart(){
        if timer == nil {
            timer = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: timerSelector, userInfo: nil, repeats: true)
        }
    }
    //Timer Stop
    func timerStop(){
        timer?.invalidate()
        timer = nil
    }

    
    //칸 수
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 6
    }
    
    //row수(행수)
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return lottoArray.count
    }
    
    //높이설정
    func pickerView(_pickerView:UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 40
    }
    
    //배치
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {

        return "\(lottoArray[row])";
    }
    
    //PickerView Item Index
    var index: Int = 0
    
    //타이머 함수
    @objc func updateTime(){
        
        if count1 > 0 {
            pickerView.selectRow(index , inComponent: 0, animated: false)
        }
        if count2 > 0 {
            pickerView.selectRow(index, inComponent: 1, animated: false)
        }
        if count3 > 0 {
           pickerView.selectRow(index, inComponent: 2, animated: false)
        }
        if count4 > 0 {
           pickerView.selectRow(index, inComponent: 3, animated: false)
        }
        if count5 > 0 {
           pickerView.selectRow(index, inComponent: 4, animated: false)
        }
        if count6 > 0 {
           pickerView.selectRow(index, inComponent: 5, animated: false)
        }
        
        
        index += 1
        if index > lottoArray.count-5 {
                  index = 0
              }
    
        
        
        //각 컴포넌트 회전수을 감소
        count1 -= 1
        count2 -= 1
        count3 -= 1
        count4 -= 1
        count5 -= 1
        count6 -= 1
        
        //마지막 휠이 정지되었을때 종료
        if count6 < 0 {
            timerStop()
            
            //각컴포넌트에 선택된 인덱스
            var s1 = pickerView.selectedRow(inComponent: 0)
            var s2 = pickerView.selectedRow(inComponent: 1)
            var s3 = pickerView.selectedRow(inComponent: 2)
            var s4 = pickerView.selectedRow(inComponent: 3)
            var s5 = pickerView.selectedRow(inComponent: 4)
            var s6 = pickerView.selectedRow(inComponent: 5)
            
            print("selected : \(s1)-\(s2)-\(s3)-\(s4)-\(s5)-\(s6)")
            if s1 > 44 {
                s1 = 0
            }
            if s2 > 44 {
                s2 = 0
            }
            if s3 > 44 {
                s3 = 0
            }
            if s4 > 44 {
                s4 = 0
            }
            if s5 > 44 {
                s5 = 0
            }
            if s6 > 44 {
                s6 = 0
            }
            
            print("modified : \(s1)-\(s2)-\(s3)-\(s4)-\(s5)-\(s6)")
            
            lblShowNum.layer.borderWidth = 2
            lblShowNum.layer.borderColor = UIColor.green.cgColor
            lblShowNum.text = "\(s1 + 1 ) -\(s2 + 1)-\(s3 + 1)-\(s4 + 1)-\(s5 + 1)-\(s6 + 1)"
            
        }
        
    }

}

