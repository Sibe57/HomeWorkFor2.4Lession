//
//  MainViewController.swift
//  HomeWorkFor2.4Lession
//
//  Created by Федор Еронин on 12.07.2022.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func setNewColor(_ color: UIColor)
}

class MainViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsViewController = segue.destination as? SettingsViewController
        else { return }
        settingsViewController.colorOfMainScreen = view.backgroundColor
        settingsViewController.delegate = self
    }
}

// MARK: - SettingsViewControllerDelegate

extension MainViewController: SettingsViewControllerDelegate {
    func setNewColor(_ color: UIColor) {
        view.backgroundColor = color
    }
}

