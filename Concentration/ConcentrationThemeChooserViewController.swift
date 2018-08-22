//
//  ConcentrationThemeChooserViewController.swift
//  Concentration
//
//  Created by jihooyim on 22/08/2018.
//  Copyright © 2018 임지후. All rights reserved.
//

import UIKit

class ConcentrationThemeChooserViewController: UIViewController {

    let themes = [
        "Sports" : "🏋🏼‍♀️🏊🏼‍♀️🥌🏂🏑🏌🏽‍♀️⛹🏼‍♂️🥇",
        "Animals" : "🐬🐆🦄🐶🐥🙈🦕🦋",
        "Faces" : "🧐🤪😇🤩😨😔🤬☺️"
    ]

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Choose Theme" {
                if let themeName = (sender as? UIButton)?.currentTitle, let theme = themes[themeName] {
                    if let cvc = segue.destination as? ConcentraionViewController {
                        cvc.theme = theme
                    }
            }
        }
    }
    

}
