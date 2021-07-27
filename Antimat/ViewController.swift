//
//  ViewController.swift
//  Antimat
//
//  Created by Ivan Pavlenko on 26.07.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        task10()
    }
    
    
    func task10() {

        let badWordsText = "My Pick is grEat, my pick is very great"
        let filterWords = ["pick", "great"]
         
        print(antiMat(text: badWordsText, filter: filterWords))
    }
    
    func antiMat(text: String, filter: Array<String>) -> String {
        
        var fixedText = text
         
        for mat in filter {

            let lengthMat = mat.count
            var position = 0
           
            while position != text.count {
               
                if text.count - position  >= lengthMat {

                    let range = fixedText[fixedText.index(fixedText.startIndex, offsetBy: position)..<fixedText.index(fixedText.startIndex, offsetBy: position + lengthMat)]
                    
                    if range.lowercased() == mat.lowercased() {
                        let cutRange = fixedText.index(fixedText.startIndex, offsetBy: position)..<fixedText.index(fixedText.startIndex, offsetBy: position + lengthMat)
                        fixedText.removeSubrange(cutRange)
                        fixedText.insert(contentsOf:starOnMat(mat: mat), at: fixedText.index(fixedText.startIndex, offsetBy: position))
                        position += lengthMat
                    } else {
                       
                        position += 1
                    }
                    
                } else {
                    position = text.count
                }

            }
            
        }
        return fixedText
    }

    func starOnMat(mat: String) -> String {
        var starRow = ""
        for _ in 0..<mat.count {
            starRow += "*"
        }
        return starRow
    }


}

