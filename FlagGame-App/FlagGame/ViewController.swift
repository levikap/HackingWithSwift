//
//  ViewController.swift
//  FlagGame
//
//  Created by Levi Kaplan on 8/16/19.
//  Copyright © 2019 Levi Kaplan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var correctAnswer = 0
    var score = 0
    var qAsked = 1
    var displayVictory = false
    var add1 = 0
    var sendTitle = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        

        // add the countries in the game to the countries array
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "\(score)", style: .plain, target: self, action: #selector(shareTapped))
        
        // gives boarders to the buttons so they can be seen more clearly
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        // changes the color of the border
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion(action: nil)
    }
    
    // sets the image of the buttons to three random flags
    func askQuestion(action: UIAlertAction!) {
        
        // shuffle the array to get some random flags
        countries.shuffle()
        
        // set the buttons to the first three elements of the shuffled array
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        // generates a random number to determine which flag is correct
        correctAnswer = Int.random(in: 0...2)
        
        title = countries[correctAnswer].uppercased()
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        
        // determine if the user pressed the right button by comparing the tag of pressed to the right answer
   
        if displayVictory == true {
            qAsked = 0
            score = score + add1
            title = sendTitle
            updateScore()
            displayVictory = false
            let ac = UIAlertController(title: title, message: "Thank you for playing! Your final score is \(score)", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            present(ac, animated: true)
            score = 0
            
            
        }
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
            qAsked += 1
            
            if qAsked >= 3 {
                displayVictory = true
                add1 = 1
                sendTitle = title
            }
            
            let ac = UIAlertController(title: title, message: "Your score is \(score).", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            present(ac, animated: true)
            updateScore()
            
            
        } else {
            title = "Wrong"
            score -= 1
            qAsked += 1
            
            if qAsked >= 3 {
                displayVictory = true
                add1 = -1
                sendTitle = title
            }
            
            let ac = UIAlertController(title: title, message: "That was the flag of \(countries[sender.tag]). Your score is \(score).", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            present(ac, animated: true)
            updateScore()
            
        }
        
       
    }
    
    @objc func shareTapped() {
        
        let vc = UIActivityViewController(activityItems: [score], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
    
    func updateScore() {
         navigationItem.rightBarButtonItem = UIBarButtonItem(title: "\(score)", style: .plain, target: self, action: #selector(shareTapped))
    }
    
}

