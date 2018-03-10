//
//  ViewController.swift
//  TicTacToe
//
//  Created by Jack Rosetti on 12/17/17.
//  Copyright © 2017 achoodev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var activePlayer = 1 //cross
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    let winningCombo = [[0, 1, 2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8],[0,4,8], [2,4,6]]
    var active = true
    
    @IBOutlet weak var label: UILabel!
    @IBAction func action(_ sender: AnyObject)
    {
        if (gameState[sender.tag-1]==0 && active==true)
        {
            gameState[sender.tag-1]=activePlayer
            
            if(activePlayer==1)
            {
                sender.setImage(UIImage(named: "x.png"), for: UIControlState())
                activePlayer = 2
            }
            else
            {
                sender.setImage(UIImage(named: "o.png"), for: UIControlState())
                activePlayer = 1
            }
        }
        for combination in winningCombo
        {
            if (gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]])
            {
                active = false
                
                if(gameState[combination[0]]==1)
                {
                    label.text = "X HAS WON"
                }
                else
                {
                    label.text = "O HAS WON"
                }
                playAgainButton.isHidden = false
                label.isHidden = false
            }
            
        }
        
        active = false
        for i in gameState
        {
            if i == 0
            {
                active = true
                break
            }
        }
        
        if(active == false)
        {
            label.text = "TIE GAME"
            label.isHidden = false
            playAgainButton.isHidden = false
        }
        
    }
    
    @IBOutlet weak var playAgainButton: UIButton!
    @IBAction func playAgain(_ sender: AnyObject)
    {
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        active = true
        activePlayer = 1
        
        label.isHidden = true
        playAgainButton.isHidden = true
        
        for i in 1...9
        {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControlState())
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

