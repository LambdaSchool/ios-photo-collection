//
//  SelectThemeController.swift
//  Photo Collection
//
//  Created by Simon Elhoej Steinmejer on 02/08/18.
//  Copyright © 2018 Simon Elhoej Steinmejer. All rights reserved.
//

import UIKit

class SelectThemeController: UIViewController
{
    var themeHelper: ThemeHelper?
    
    let selectThemeLabel: UILabel =
    {
        let label = UILabel()
        label.text = "Select a theme for Photo Collection"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.sizeToFit()
        
        return label
    }()
    
    let darkThemeButton: UIButton =
    {
        let button = UIButton(type: .system)
        button.setTitle("Dark", for: .normal)
        button.backgroundColor = .darkGray
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 6
        button.addTarget(self, action: #selector(handleDarkTheme), for: .touchUpInside)
        
        return button
    }()
    
    let blueThemeButton: UIButton =
    {
        let button = UIButton(type: .system)
        button.setTitle("Blue", for: .normal)
        button.backgroundColor = .blue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 6
        button.addTarget(self, action: #selector(handleBlueTheme), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        
    }
    
    @objc private func handleDarkTheme()
    {
        themeHelper?.setThemePreferenceToDark()
        dismiss(animated: true, completion: nil)
    }
    
    @objc func handleBlueTheme()
    {
        themeHelper?.setThemePreferenceToBlue()
        dismiss(animated: true, completion: nil)
    }
    
    
    private func setupUI()
    {
        view.addSubview(selectThemeLabel)
        
        let stackView = UIStackView(arrangedSubviews: [darkThemeButton, blueThemeButton])
        stackView.axis = .horizontal
        stackView.spacing = 12
        stackView.distribution = .fillEqually
        
        view.addSubview(stackView)
        
        selectThemeLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 100, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 0, height: 0)
        selectThemeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        stackView.anchor(top: selectThemeLabel.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: nil, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 30, paddingLeft: 40, paddingRight: 40, paddingBottom: 0, width: 0, height: 50)
    }
    
    
}















