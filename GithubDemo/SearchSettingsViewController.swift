//
//  SearchSettingsViewController.swift
//  GithubDemo
//
//  Created by daniel on 2/23/17.
//  Copyright © 2017 codepath. All rights reserved.
//

import UIKit

class SearchSettingsViewController: UIViewController
{

    @IBOutlet weak var filterByLanguageSwitch: UISwitch!
    @IBOutlet weak var minimumStars: UILabel!
    @IBOutlet weak var starsSlider: UISlider!
    
    weak var delegate: SettingsPresentingViewControllerDelegate?
    var settings: GithubRepoSearchSettings?

    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        starsSlider.value = Float(settings!.minStars)
        minimumStars.text = "\(settings!.minStars)"
        starsSlider.isContinuous = true
    }

    @IBAction func didChangeStartSlider(_ sender: Any)
    {
        let minStars = Int(starsSlider.value)
        minimumStars.text = "\(minStars)"
        settings?.minStars = minStars
        print(starsSlider.value)
    }
    
    @IBAction func didFilterbyLanguage(_ sender: UISwitch)
    {
        print(sender.isOn)
    }
    
    @IBAction func onSave(_ sender: Any)
    {
        delegate?.didSaveSettings(settings: settings!)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onCancel(_ sender: Any)
    {
        delegate?.didCancelSettings()
        dismiss(animated: true, completion: nil)
    }

}

protocol SettingsPresentingViewControllerDelegate: class
{
    func didSaveSettings(settings: GithubRepoSearchSettings)
    func didCancelSettings()
}
