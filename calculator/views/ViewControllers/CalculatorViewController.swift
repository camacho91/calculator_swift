//
//  CalculatorViewController.swift
//  calculator
//
//  Created by Backlayer on 7/6/19.
//  Copyright © 2019 calculator test. All rights reserved.
//

import UIKit


var comicList: [comics] = []
var characterList: [characters] = []
var creatorList: [creators] = []
var eventList: [events] = []
var seriesList: [series] = []
var storiesList: [stories] = []

var marvelViewModelObj = MarvelCalculatorViewModel(apiClientHandler: RequestHandlers())


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
    
    func Validation(){
        
        let content = txtEquation.text
        
        let containsString = StringHandlers.ValidateEquation(equationValue: content!)
        
        
        if (containsString == true){
            showModalMessage(messageContent: "Your equation cannot contains letters", messageTitle: "Error")
            
            return
        }
        
        if (txtEquation.text!.isEmpty){
            showModalMessage(messageContent: "Invalid Equation", messageTitle: "Error")
            
            return
        }
        
        let evaluatedEquationSignRule = StringHandlers.EvaluatesignRule(equationValue: content!)
        let isValidEquation = StringHandlers.EvaluateParenthesisRule(equationValue: evaluatedEquationSignRule)
        
        if (isValidEquation == true){
            CalculateValue(value: evaluatedEquationSignRule)
        }else{
            txtOutPut.text = "Invalid Equation"
        }
        
    }
    
    @IBAction func click_event(_ sender: Any) {
       
        Validation()
    }
    
    
    // MARK:  Setup the view and format any UI changes before the view is loaded
    func setupView(){
        navigationController?.setNavigationBarHidden(true, animated: true)
        vwCalculatorContainer.borderShadow()
        vwCalculatorContainer.layer.cornerRadius = 20.0
    }
    
    
    // MARK:  Perform Calculation for the equation
    func CalculateValue(value: String){
        
        MultipleChecker.resetValue()
        
        let mathExpression = NSExpression(format: value)
        let mathValue = mathExpression.expressionValue(with: nil, context: nil)
            as? Int
        
        txtOutPut.text = String(format: "Result: %@", String(mathValue!))
        
        _ = MultipleChecker.CheckMultiple(value: mathValue!)
        marvelViewModelObj.MarvelData.removeAll()
        
        marvelViewModelObj.GetMarvelAPIResults()
        
        marvelViewModelObj.loadingFinished = {
            self.performSegueToContent()
            
        }
        
       
    }
    
    func performSegueToContent(){
        performSegue(withIdentifier: "segueContent", sender: self)
        
    }
    func showModalMessage(messageContent: String, messageTitle: String){
        let alert = UIAlertController(title: messageTitle, message: messageContent, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        self.present(alert, animated: true)
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



