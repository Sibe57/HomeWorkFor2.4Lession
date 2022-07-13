//
//  MainViewController.swift
//  HomeWorkFor2.4Lession
//
//  Created by Федор Еронин on 12.07.2022.
//

import UIKit

class MainViewController: UIViewController {

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsViewController = segue.destination as? SettingsViewController
        else {
            return
        }
        settingsViewController.colorMainView = view.backgroundColor
    }
}
