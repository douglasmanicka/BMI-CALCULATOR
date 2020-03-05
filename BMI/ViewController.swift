//
//  ViewController.swift
//  BMI
//
//  Created by Douglas Manicka on 03/03/20.
//  Copyright © 2020 Douglas Manicka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textFieldWeight: UITextField!
    @IBOutlet weak var textFieldHeigth: UITextField!
    @IBOutlet weak var labelResult: UILabel!
    @IBOutlet weak var imageViewResult: UIImageView!
    @IBOutlet weak var uiViewResult: UIView!
    
    
    var bmi: Double = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func calculate(_ sender: Any) {
        guard let textWeight = textFieldWeight.text, !textWeight.isEmpty, let  weight = Double(textWeight.replacingOccurrences(of: ",", with: "."))  else { return}
        guard let textHeigth = textFieldHeigth.text, !textHeigth.isEmpty, let  height = Double(textHeigth.replacingOccurrences(of: ",", with: "."))  else { return}
        bmi = weight / pow(height, 2)
        showResults()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func showResults(){
        var result: String = ""
        var image: String =  ""
        switch bmi {
            case 0..<16:
                result = "Magreza"
                image =  "magreza"
            case 16..<18.5:
                result = "Abaixo do Peso"
                image = "abaixo"
            case 18.5..<25:
                result = "Peso Ideal"
                image = "ideal"
            case 25..<30:
                result = "Sobre Peso"
                image = "sobre"
          
            default:
                result = "Obesidade"
                image = "obesidade"
        }
        labelResult.text = "\(Int(bmi)) : \(result)"
        imageViewResult.image = UIImage(named: image)
        uiViewResult.isHidden = false
        view.endEditing(true)
    }
}

