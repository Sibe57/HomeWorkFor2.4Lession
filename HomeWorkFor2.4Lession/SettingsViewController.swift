//
//  SettingsViewController.swift
//  HomeWorkFor2.4Lession
//
//  Created by Федор Еронин on 24.06.2022.
//

import UIKit

class SettingsViewController: UIViewController {
    
    
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    
    var delegate: SettingsViewControllerDelegate!
    var colorOfMainScreen: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorView.backgroundColor = colorOfMainScreen
        setSliders()
        
        setValue(for: redLabel, blueLabel, greenLabel)
    }
    
    @IBAction func sliderChandes(_ sender: UISlider) {
        setColor()
        switch sender {
        case redSlider:
            setValue(for: redLabel)
        case greenSlider:
            setValue(for: greenLabel)
        default:
            setValue(for: blueLabel)
        }
    }
    
    @IBAction func doneButtonPressed() {
        delegate.setNewColor(colorView.backgroundColor ?? .white)
        dismiss(animated: true)
    }
    
    private func setColor() {
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    
    private func setValue(for labels: UILabel...) {
        labels.forEach {
            switch $0 {
            case redLabel:
                redLabel.text = string(from: redSlider)
            case greenLabel:
                greenLabel.text = string(from: greenSlider)
            default:
                blueLabel.text = string(from: blueSlider)
            }
        }
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
    private func setSliders() {
        let color = CIColor(color: colorOfMainScreen)
        redSlider.value = Float(color.red)
        greenSlider.value = Float(color.green)
        blueSlider.value = Float(color.blue)
    }
}

