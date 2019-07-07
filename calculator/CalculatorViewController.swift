//
//  CalculatorViewController.swift
//  calculator
//
//  Created by Backlayer on 7/6/19.
//  Copyright © 2019 calculator test. All rights reserved.
//

import UIKit


var comicList: [comics] = []

class CalculatorViewController: UIViewController {

    @IBOutlet weak var vwCalculatorContainer: UIView!
    @IBOutlet weak var txtEquation: UITextField!
    @IBOutlet weak var txtOutPut: UILabel!
    @IBOutlet weak var btnCalculate: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    @IBAction func text_changed(_ sender: Any) {
        
    }
    
    
    
    @IBAction func click_event(_ sender: Any) {
        
        let content = txtEquation.text
        
        CalculateValue(value: content!)
        
    }
    
    
    // MARK:  Setup the view and format any UI changes before the view is loaded
    func setupView(){
        navigationController?.setNavigationBarHidden(true, animated: true)
        vwCalculatorContainer.borderShadow()
        vwCalculatorContainer.layer.cornerRadius = 20.0
    }
    
    
    func CalculateValue(value: String){
        
        MultipleChecker.resetValue()
        
        let mathExpression = NSExpression(format: value)
        let mathValue = mathExpression.expressionValue(with: nil, context: nil)
            as? Int
        
        txtOutPut.text = String(format: "Result: %@", String(mathValue!))
        
        _ = MultipleChecker.CheckMultiple(value: mathValue!)
   
        
        
      
        RequestHandlers.getComics() { result in
            
                
                let stringValue = String(describing: result)
                //let newString = stringValue.replacingOccurrences(of: "\\", with: "")
                let somedata = Data(stringValue.utf8)
                
                
                let serializedObject = try! JSONDecoder().decode(GeneralClass.self, from: somedata )
              
                for word in serializedObject.data.results {
                    let data = comics(_title: word.title, _id: word.id)
                    comicList.append(data)
                }
            
                self.performSegueToContent()
            
        }
       
        
    }
    
    func performSegueToContent(){
        performSegue(withIdentifier: "segueContent", sender: self)
        
    }
    
    
    
    

}

extension UIView {
    func borderShadow(scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor(red:0.54,green:0.54,blue:0.54,alpha:0.2).cgColor
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 10
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
}



