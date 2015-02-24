//
//  ViewController.swift
//  TicTacToe - Swift
//
//  Created by Jian Yao Ang on 2/20/15.
//  Copyright (c) 2015 Jian Yao Ang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIAlertViewDelegate {

    @IBOutlet var labelOne: UILabel!
    @IBOutlet var labelTwo: UILabel!
    @IBOutlet var labelThree: UILabel!
    @IBOutlet var labelFour: UILabel!
    @IBOutlet var labelFive: UILabel!
    @IBOutlet var labelSix: UILabel!
    @IBOutlet var labelSeven: UILabel!
    @IBOutlet var labelEight: UILabel!
    @IBOutlet var labelNine: UILabel!
    
    @IBOutlet var playersTurnLabel: UILabel!
    @IBOutlet var tapGestureRecognizer: UITapGestureRecognizer!
    
    var currentPlayer: String!
    let PLAYER1: String! = "X"
    let PLAYER2: String! = "O"
    var isPlayerOne: Bool = true
    var isADrawGame: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.playersTurnLabel.text = "Player 1"
        self.playersTurnLabel.textColor = UIColor.whiteColor()
        self.currentPlayer = PLAYER1
    
    }
    
    func settingLabelColor(theLabel label: UILabel) {
        
        if self.currentPlayer == PLAYER1
        {
            label.textColor = UIColor.redColor()
            label.text = "X"
        }
        else
        {
            label.textColor = UIColor.blueColor()
            label.text = "O"
        }
    }

    func checkingForWinningCombo() -> String {
    
        if  self.labelOne.text == "X" &&
            self.labelTwo.text == "X" &&
            self.labelThree.text == "X"
        {
            return "Player 1"
            
        }
        else if self.labelFour.text == "X" &&
                self.labelFive.text == "X" &&
                self.labelSix.text == "X"
        {
            return "Player 1"
        }
        else if self.labelSeven.text == "X" &&
                self.labelEight.text == "X" &&
                self.labelNine.text == "X"
        {
            return "Player 1"
        }
        else if self.labelOne.text == "X" &&
                self.labelFive.text == "X" &&
                self.labelNine.text == "X"
        {
            return "Player 1"
        }
        else if  self.labelSeven.text == "X" &&
                self.labelFive.text == "X" &&
                self.labelThree.text == "X"
        {
            return "Player 1"
        }
        else if self.labelOne.text == "X" &&
                self.labelFour.text == "X" &&
                self.labelSeven.text == "X"
        {
            return "Player 1"
        }
        else if self.labelTwo.text == "X" &&
                self.labelFive.text == "X" &&
                self.labelEight.text == "X"
        {
            return "Player 1"
        }
        else if self.labelThree.text == "X" &&
                self.labelSix.text == "X" &&
                self.labelNine.text == "X"
        {
            return "Player 1"
        }
        else if  self.labelOne.text == "O" &&
                 self.labelTwo.text == "O" &&
                 self.labelThree.text == "O"
        {
            return "Player 2"
        }
        else if self.labelFour.text == "O" &&
                self.labelFive.text == "O" &&
                self.labelSix.text == "O"
        {
            return "Player 2"
        }
        else if self.labelSeven.text == "O" &&
                self.labelEight.text == "O" &&
                self.labelNine.text == "O"
        {
            return "Player 2"
        }
        else if self.labelOne.text == "O" &&
                self.labelFive.text == "O" &&
                self.labelNine.text == "O"
        {
            return "Player 2"
        }
        else if  self.labelSeven.text == "O" &&
                 self.labelFive.text == "O" &&
                 self.labelThree.text == "O"
        {
            return "Player 2"
        }
        else if self.labelOne.text == "O" &&
            self.labelFour.text == "O" &&
            self.labelSeven.text == "O"
        {
            return "Player 2"
        }
        else if self.labelTwo.text == "O" &&
            self.labelFive.text == "O" &&
            self.labelEight.text == "O"
        {
            return "Player 2"
        }
        else if self.labelThree.text == "O" &&
            self.labelSix.text == "O" &&
            self.labelNine.text == "O"
        {
            return "Player 2"
        }
        else
        {
            checkingForDraw()
            return ""
        }
    }
    
    func checkingForDraw() {
        
        if self.labelOne.text != "" && self.labelTwo.text != "" && self.labelThree.text != "" && self.labelFour.text != "" && self.labelFive.text != "" && self.labelSix.text != "" && self.labelSeven.text != "" && self.labelEight.text != "" && self.labelNine.text != ""
        {
            let okAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)

            let alertController: UIAlertController = UIAlertController(title: "TicTacToe - Swift", message: "It's a draw! What a match!", preferredStyle: UIAlertControllerStyle.Alert)

            alertController.addAction(okAction)

            self.presentViewController(alertController, animated: true, completion: nil)
            
            clearingGameArea()
        }
    }
    
    @IBAction func tapOnTheGameArea(sender: UITapGestureRecognizer)
    {
        let tappedPoint: CGPoint = sender.locationInView(self.view)
        
        let tappedLabel: UILabel? = findLabelUsingPoint(tappedPoint)
 
        if isPlayerOne
        {
            if (tappedLabel != nil && tappedLabel?.text == "")
            {
                tappedLabel!.text = "X"
                tappedLabel!.font = UIFont(name: "HelveticaNeue", size: 20)
                tappedLabel!.textColor = UIColor.redColor()
                self.playersTurnLabel.text = "Player 2"
                self.playersTurnLabel.textColor = UIColor.whiteColor()
                isPlayerOne = false
                
                notifyingResultsToUser()
            }
        }
        else
        {
            if tappedLabel != nil && tappedLabel?.text == ""
            {
                tappedLabel!.text = "O"
                tappedLabel!.font = UIFont(name: "HelveticaNeue", size: 20)
                tappedLabel!.textColor = UIColor.blueColor()
                self.playersTurnLabel.text = "Player 1"
                self.playersTurnLabel.textColor = UIColor.whiteColor()
                isPlayerOne = true
                
                notifyingResultsToUser()
            }
        }
    }
    
    func findLabelUsingPoint(pointOfLabel: CGPoint) -> UILabel?
    {
        for label in self.view.subviews
        {
            if CGRectContainsPoint(label.frame, pointOfLabel)
            {
                return label as? UILabel
            }
        }
        return nil
    }

    func notifyingResultsToUser()
    {
        if checkingForWinningCombo() == "Player 1"
        {
            let okAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
            
            let alertController: UIAlertController = UIAlertController(title: "TicTacToe-Swift", message: "Player 1 wins!", preferredStyle: UIAlertControllerStyle.Alert)
            
            alertController.addAction(okAction)
            
            self.presentViewController(alertController, animated: true, completion: nil)
            
            clearingGameArea()
        }
        else if checkingForWinningCombo() == "Player 2"
        {
            let okAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
            
            let alertController: UIAlertController = UIAlertController(title: "TicTacToe-Swift", message: "Player 2 wins!", preferredStyle: UIAlertControllerStyle.Alert)
            
            alertController.addAction(okAction)
            
            self.presentViewController(alertController, animated: true, completion: nil)
            
            clearingGameArea()
        }
    }
    
    func clearingGameArea() {
        self.labelOne.text = ""
        self.labelTwo.text = ""
        self.labelThree.text = ""
        self.labelFour.text = ""
        self.labelFive.text = ""
        self.labelSix.text = ""
        self.labelSeven.text = ""
        self.labelEight.text = ""
        self.labelNine.text = ""
        
        self.playersTurnLabel.text = "Player 1";
        self.playersTurnLabel.textColor = UIColor.whiteColor()
        self.isPlayerOne = true
    }
    
}

