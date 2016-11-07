//
//  LLViewController.swift
//  Demo161020
//
//  Created by R on 2016/10/20.
//  Copyright © 2016年 R. All rights reserved.
//

import UIKit

class LLViewController: UIViewController,UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource {
    
    @IBOutlet weak var starTextField: UITextField!
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        starTextField.resignFirstResponder()
    }

    @IBOutlet weak var mfChoose: UISegmentedControl!
    @IBOutlet weak var trueHeart: UISwitch!
    @IBOutlet weak var ageHow: UILabel!
    @IBOutlet weak var answer: UISegmentedControl!
    
    var data = ["水瓶座", "雙魚座", "牡羊座", "金牛座", "雙子座", "巨蟹座", "獅子座", "處女座", "天秤座", "天蠍座", "射手座", "摩羯座"]
    var picker = UIPickerView()
    
    
    @IBAction func ageBar(_ sender: UISlider) {
        ageHow.text = "\(Int(sender.value))"
    }
    
    @IBAction func clickButton(_ sender: AnyObject) {
        let star = starTextField.text!
        let year = Int(ageHow.text!)
        if (star == "水瓶座" || star == "巨蟹座" ) && mfChoose.selectedSegmentIndex == 0 && trueHeart.isOn == true && year! >= 20 && year! <= 40 {
            answer.selectedSegmentIndex = 0
        }else{
            answer.selectedSegmentIndex = 1
        }
        answer.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        picker.delegate = self
        picker.dataSource = self
        starTextField.inputView = picker
        
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
                return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        starTextField.text = data[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return data[row]
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
