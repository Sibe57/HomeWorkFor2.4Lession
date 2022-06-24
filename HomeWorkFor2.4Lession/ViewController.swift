//
//  ViewController.swift
//  HomeWorkFor2.4Lession
//
//  Created by Федор Еронин on 24.06.2022.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - IBOutlets
    
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    
    @IBOutlet var redValue: UILabel!
    @IBOutlet var blueValue: UILabel!
    @IBOutlet var greenValue: UILabel!
    
    //MARK: - Methods

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //MARK: - IBActions
    @IBAction func sligersChanged() {
        
        let color = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1)
        colorView.backgroundColor = color
        
        let roundedRedValue = (redSlider.value * 100).rounded() / 100
        let roundedGreenValue = (greenSlider.value * 100).rounded() / 100
        let roundedBlueValue = (blueSlider.value * 100).rounded() / 100
        redValue.text = String(roundedRedValue)
        greenValue.text = String(roundedGreenValue)
        blueValue.text = String(roundedBlueValue)
        
    }
}

