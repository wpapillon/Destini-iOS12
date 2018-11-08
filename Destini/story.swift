//
//  story.swift
//  Destini
//
//  Created by Yexiao Wu on 2018-11-07.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import Foundation

class Story
{
    let storyText : String
    let firstAnswer : String
    let secondAnswer :String
    var firstChild : Story?
    var secondChild : Story?

    
    init(storyContent:String,firstAn:String,secondAn:String) {
      storyText = storyContent
        firstAnswer = firstAn
        secondAnswer = secondAn
       
    }
    func SetStoryOne(story:Story)
    {
        firstChild = story
    }
    func SetStoryTwo(story:Story)
    {
        secondChild = story
    }
}

