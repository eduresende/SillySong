//
//  ViewController.swift
//  Silly Song
//
//  Created by Eduardo Resende Pereira on 16/12/16.
//  Copyright © 2016 Eduardo Resende. All rights reserved.
//

import UIKit



let bananaFanaTemplate = [
    "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
    "Banana Fana Fo F<SHORT_NAME>",
    "Me My Mo M<SHORT_NAME>",
    "<FULL_NAME>"].joined(separator: "\n")

func shortNameFromName(name: String) -> String {

    var newName = ""
    var firstVowelFound = false
    let vowels = ["a", "e", "i", "o", "u"]

    for c in name.lowercased().characters {
        if !firstVowelFound && vowels.contains(String(c)) {
            firstVowelFound = true
        }

        if firstVowelFound {
            newName.append(String(c))
        }
    }

    return newName
}

func lyricsForName(lyricsTemplate: String, fullName: String) -> String {

    let shortName = shortNameFromName(name: fullName)

    let lyrics = lyricsTemplate
        .replacingOccurrences(of: "<FULL_NAME>", with: fullName)
        .replacingOccurrences(of: "<SHORT_NAME>", with: shortName)


    return lyrics
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var lyricsView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func reset(_ sender: UITextField) {
        nameField.text = ""
        lyricsView.text = ""
    }

    @IBAction func displayLyrics(_ sender: UITextField) {
        print("tor aqui")
        
        let fullName = nameField.text

        if let fullName = fullName {
            lyricsView.text =  lyricsForName(lyricsTemplate: bananaFanaTemplate, fullName: fullName)
        }
    }


}

