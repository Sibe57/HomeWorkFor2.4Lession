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
    
    @IBOutlet weak var redTextField: UITextField!
    @IBOutlet weak var greenTextField: UITextField!
    @IBOutlet weak var blueTextField: UITextField!
    
    var delegate: SettingsViewControllerDelegate!
    var colorOfMainScreen: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
  
        colorView.backgroundColor = colorOfMainScreen
        setSliders()
        
        setValue(for: redLabel, blueLabel, greenLabel)
        setValue(for: redTextField, blueTextField, greenTextField)
        createToolBar()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    @IBAction func sliderChandes(_ sender: UISlider) {
        
        setColor()
        
        switch sender {
        case redSlider:
            setValue(for: redLabel)
            setValue(for: redTextField)
        case greenSlider:
            setValue(for: greenLabel)
            setValue(for: greenTextField)
        default:
            setValue(for: blueLabel)
            setValue(for: blueTextField)
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
    
    private func setValue(for textFields: UITextField...) {
        
        textFields.forEach {
            switch $0 {
            case redTextField:
                redTextField.text = string(from: redSlider)
            case greenTextField:
                greenTextField.text = string(from: greenSlider)
            default:
                blueTextField.text = string(from: blueSlider)
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
    
    private func createToolBar() {
        
        let bar = UIToolbar()
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                            target: nil,
                                            action: nil)
        
        let done = UIBarButtonItem(title: "Done",
                                   style: .done,
                                   target: self,
                                   action: #selector(keyboardDoneButtonPressed))
        
        bar.items = [flexibleSpace, done]
        bar.sizeToFit()
        redTextField.inputAccessoryView = bar
        greenTextField.inputAccessoryView = bar
        blueTextField.inputAccessoryView = bar
    }
    
    @objc func keyboardDoneButtonPressed() {
        
        view.endEditing(true)
    }
}

// MARK: - UITextFieldDelegate Methods

extension SettingsViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        guard let text = textField.text,
              let colorComponent = Float(text),
              colorComponent >= 0,
              colorComponent <= 1
        else {
            textField.textColor = .red
            return
        }
        
        switch textField {
        case redTextField:
            redSlider.setValue(colorComponent, animated: true)
            setValue(for: redLabel)
            setValue(for: redTextField)
        case greenTextField:
            greenSlider.setValue(colorComponent, animated: true)
            setValue(for: greenLabel)
            setValue(for: greenTextField)
        default:
            blueSlider.setValue(colorComponent, animated: true)
            setValue(for: blueLabel)
            setValue(for: blueTextField)
        }
        
        setColor()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.textColor = .black
    }
}
