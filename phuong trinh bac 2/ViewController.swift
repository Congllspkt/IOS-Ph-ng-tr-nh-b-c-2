//
//  ViewController.swift
//  phuong trinh bac 2
//
//  Created by Cntt27 on 4/8/17.
//  Copyright © 2017 Cntt27. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var cx: UITextField!
    @IBOutlet weak var bx: UITextField!
    @IBOutlet weak var ax: UITextField!
    
    @IBOutlet weak var kq: UITextView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.ax.delegate = self;
        self.bx.delegate = self;
        self.cx.delegate = self;

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let inverseSet = NSCharacterSet(charactersIn:"0123456789").inverted
        
        let components = string.components(separatedBy: inverseSet)
        
        let filtered = components.joined(separator: "")
        
        if filtered == string {
            return true
        }
        else {
            if string == "." {
                let countdots = textField.text!.components(separatedBy:".").count - 1
                if countdots == 0 {
                    return true
                }else{
                    if countdots > 0 && string == "." {
                        return false
                    } else {
                        return true
                    }
                }
            }else{
                if string == "-" {
                    if textField.text!.isEmpty {
                        return true
                    } else {
                        return false
                    }
                } else {
                    return false
                }
            }
        }
    }
    
    
    
    
    @IBAction func btn(_ sender: Any) {
        if(ax.text == "" || bx.text == "" || cx.text == "")
        {
            kq.text = "Nhập đầy đủ dữ liệu nhé"
            return
        }
        var numa:Double = 0;
        var numb:Double = 0;
        var numc:Double = 0;
        numa = Double(ax.text!)!
        numb = Double(bx.text!)!
        numc = Double(cx.text!)!
        
        let delta:Double = numb*numb - 4*numa*numc
        
        let deltaCan:Double = delta.squareRoot()
        
        if(numa == 0)
        {
            if(numb==0)
            {
                if(numc==0)
                {
                    kq.text = "Phuong trinh vo so nghiem nhe!"
                    kq.textColor = UIColor.red
                }
                else
                {
                    kq.text = "Phuong trinh vo nghiem"
                    kq.textColor = UIColor.red
                }
            }
            else
            {
                kq.text = "Phuong trinh co mot nghiem duy nhat"
                kq.text = kq.text + "\n .x = " + String(format:"%.2f",-numc/numb)


            }
        }
        else
        {
        if(delta < 0){
            kq.text = "Phuong trinh vo nghiem nhe!"
            kq.textColor = UIColor.red
            
            
        }
        else{
            if(delta == 0){
                kq.textColor = UIColor.black
                kq.text = "Phuong trinh co nghiem kep nhe!"
                kq.text = kq.text + "\n .x = " + String(format:"%.2f",-numb / (2*numa))
            }
            else{
                kq.textColor = UIColor.black
                kq.text = "Phuong trinh co 2 nghiem phan biet nhe!"
                kq.text = kq.text + "\n .x1 = " + String(format:"%.2f",(-numb - deltaCan) / (2*numa))
                kq.text = kq.text + "\n .x2 = " + String(format:"%.2f",(-numb + deltaCan) / (2*numa))
                
            }

        }
        
    }
    }

}

