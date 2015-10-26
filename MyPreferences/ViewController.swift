//
//  ViewController.swift
//  MyPreferences
//
//  Created by Charles Konkol on 3/23/15.
//  Copyright (c) 2015 Rock Valley College. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
    
    @IBAction func btnClear(sender: AnyObject) {
        
        let defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        
        defaults.setObject(nil, forKey: "nickname")
        defaults.setObject(nil, forKey: "favoritenumber")
        defaults.setObject(nil, forKey: "color")

        
        defaults.synchronize()
        
        txtUsername.text = ""
        txtPassword.text = ""
        
        MyColors.selectRow(0,inComponent: 0, animated: true)
 txtUsername.becomeFirstResponder()
        
    }
    
    //color
    var selectedcolor:String!
    let pickerColor = ["Teal","Dark Blue","Green", "Purple", "Cyan", "Burn"]
    @IBAction func btnLoad(sender: UIButton) {
        let defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        
        if let userNameNotNull = defaults.objectForKey("nickname") as? String {
            self.txtUsername.text = defaults.objectForKey("nickname") as? String
        }
        
        if let passwordIsNotNill = defaults.objectForKey("favoritenumber") as? String {
            self.txtPassword.text = defaults.objectForKey("favoritenumber") as? String
        }
      
        
        if let colorIsNotNill = defaults.objectForKey("color") as? String {
            var favoriteColorSelected = defaults.objectForKey("color") as! String
            let SelectedColor:Int = (pickerColor).indexOf(favoriteColorSelected)!
           
            if (favoriteColorSelected=="Teal")
            {
                self.view.backgroundColor = UIColor.whiteColor()
            }
            if (favoriteColorSelected=="Dark Blue")
            {
                self.view.backgroundColor = UIColor.redColor()
            }
            if (favoriteColorSelected=="Green")
            {
                self.view.backgroundColor = UIColor.yellowColor()
            }
            if (favoriteColorSelected=="Purple")
            {
                self.view.backgroundColor = UIColor.blueColor()
            }
            if (favoriteColorSelected=="Cyan")
            {
                self.view.backgroundColor = UIColor.blueColor()
            }
            if (favoriteColorSelected=="Burn")
            {
                self.view.backgroundColor = UIColor.blueColor()
            }

            MyColors.selectRow(SelectedColor,inComponent: 0, animated: true)
        }
    }
    
    @IBOutlet weak var txtUsername: UITextField!

    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var MyColors: UIPickerView!
    
    
    @IBAction func btnSave(sender: UIButton) {
        let defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        
        defaults.setObject(self.txtUsername.text, forKey: "nickname")
        defaults.setObject(self.txtPassword.text, forKey: "favoritenumber")
        defaults.setObject(selectedcolor, forKey: "color")
      
        
        defaults.synchronize()
    }
    
    //Needed for picker
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerColor.count
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
         selectedcolor=pickerColor[row]
        if (selectedcolor=="Teal")
        {
            self.view.backgroundColor = UIColor(hue: 0.5417, saturation: 1, brightness: 0.6, alpha: 1.0)
        }
        if (selectedcolor=="Dark Blue")
        {
             self.view.backgroundColor = UIColor(hue: 0.675, saturation: 1, brightness: 0.59, alpha: 1.0)
        }
        if (selectedcolor=="Green")
        {
             self.view.backgroundColor = UIColor.greenColor()
        }
        if (selectedcolor=="Purple")
        {
             self.view.backgroundColor = UIColor.purpleColor()
        }
        if (selectedcolor=="Cyan")
        {
            self.view.backgroundColor = UIColor.cyanColor()
        }
        if (selectedcolor=="Burn")
        {
            self.view.backgroundColor = UIColor(hue: 0, saturation: 1, brightness: 0.53, alpha: 1.0) 
        }
        return pickerColor[row]
       
    }
    //new method hiding keyboard
  override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches , withEvent: event)
    }
    //set delegate to all uitextfields
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtUsername.becomeFirstResponder()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

