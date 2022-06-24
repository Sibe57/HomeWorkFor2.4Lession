//
//  ViewController.swift
//  HomeWorkFor2.4Lession
//
//  Created by Федор Еронин on 24.06.2022.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    
    @IBOutlet var redValue: UILabel!
    @IBOutlet var blueValue: UILabel!
    @IBOutlet var greenValue: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        slidersChanged()
    }
    
    
    @IBAction func slidersChanged() {
        
        let redComponent = redSlider.value
        let greenComponent = greenSlider.value
        let blueComponent = blueSlider.value
        
        let color = UIColor(
            red: CGFloat(redComponent),
            green: CGFloat(greenComponent),
            blue: CGFloat(blueComponent),
            alpha: 1)
        colorView.backgroundColor = color
        
        let roundedRedValue = (redComponent * 100).rounded() / 100
        let roundedGreenValue = (greenComponent * 100).rounded() / 100
        let roundedBlueValue = (blueComponent * 100).rounded() / 100
        
        redValue.text = String(roundedRedValue)
        greenValue.text = String(roundedGreenValue)
        blueValue.text = String(roundedBlueValue)
        
    }
}

