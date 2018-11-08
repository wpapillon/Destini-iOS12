//
//  ViewController.swift
//  Destini
//
//  Created by Philipp Muellauer on 01/09/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
    
    var storyFour = Story(storyContent: "What? Such a cop out! Did you know traffic accidents are the second leading cause of accidental death for most adult age groups?", firstAn: "THE END", secondAn: "")
    
    var storyFive = Story(storyContent: "As you smash through the guardrail and careen towards the jagged rocks below you reflect on the dubious wisdom of stabbing someone while they are driving a car you are in.", firstAn: "THE END", secondAn: "")
    
    var storySix = Story(storyContent: "You bond with the murderer while crooning verses of \"Can you feel the love tonight\". He drops you off at the next town. Before you go he asks you if you know any good places to dump bodies. You reply: \"Try the pier.\"", firstAn: "THE END", secondAn: "")
    
    
    var storyOne = Story(storyContent: "Your car has blown a tire on a winding road in the middle of nowhere with no cell phone reception. You decide to hitchhike. A rusty pickup truck rumbles to a stop next to you. A man with a wide brimmed hat with soulless eyes opens the passenger door for you and asks: \"Need a ride, boy?\".", firstAn: "I\'ll hop in. Thanks for the help!", secondAn: "Better ask him if he\'s a murderer first.");
    
    
    var storyTwo = Story(storyContent: "He nods slowly, unphased by the question.", firstAn: "At least he\'s honest. I\'ll climb in.", secondAn: "Wait, I know how to change a tire.")
    
    var storyThree = Story(storyContent: "As you begin to drive, the stranger starts talking about his relationship with his mother. He gets angrier and angrier by the minute. He asks you to open the glovebox. Inside you find a bloody knife, two severed fingers, and a cassette tape of Elton John. He reaches for the glove box.", firstAn: "I love Elton John! Hand him the cassette tape.", secondAn: "It\'s him or me! You take the knife and stab him.")
    
    
    // UI Elements linked to the storyboard
    @IBOutlet weak var topButton: UIButton!         // Has TAG = 1
    @IBOutlet weak var RestartButton: UIButton!
    @IBOutlet weak var bottomButton: UIButton!      // Has TAG = 2
    @IBOutlet weak var storyTextView: UILabel!
    
    
    var storyCurrent = Story(storyContent: "", firstAn: "", secondAn: "")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        constructStoryBook()
        storyCurrent = storyOne
        updateUI(displayStory: storyCurrent)
        
    }
    
    @IBAction func RestartButtonPress(_ sender: UIButton) {
        updateUI(displayStory: storyOne)
    }
    
    
    // User presses one of the buttons
    @IBAction func buttonPressed(_ sender: UIButton) {
    
        if sender.tag == 1{
            if let temp2 = storyCurrent.firstChild{
                updateUI(displayStory: temp2)}
        }
        else if sender.tag == 2{
            if let temp3 = storyCurrent.secondChild{
                updateUI(displayStory: temp3)}
        }
    }
    
    func constructStoryBook(){
        
        storyOne.SetStoryOne(story: storyThree)
        storyOne.SetStoryTwo(story: storyTwo)
        
        storyTwo.SetStoryOne(story: storyThree)
        storyTwo.SetStoryTwo(story: storyFour)
        
        storyThree.SetStoryOne(story: storySix)
        storyThree.SetStoryTwo(story: storyFive)
        
    }
    
    func updateUI(displayStory:Story)
    {
        storyCurrent=displayStory
        
        if storyCurrent.firstAnswer.caseInsensitiveCompare("THE END") != ComparisonResult.orderedSame {
            
            RestartButton.isHidden = true
            topButton.isHidden = false
            bottomButton.isHidden = false
            storyCurrent = displayStory
            storyTextView.text = storyCurrent.storyText
            topButton.setTitle(storyCurrent.firstAnswer, for: UIControl.State.normal)
            bottomButton.setTitle(storyCurrent.secondAnswer, for: .normal)
        }
        else{
            storyTextView.text = storyCurrent.storyText
            RestartButton.isHidden = false
            topButton.isHidden = true
            bottomButton.isHidden = true
        }
        
    }


}

