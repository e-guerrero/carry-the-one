//
//  ViewController.swift
//  AddSubtract
//
//  Created by Edwin on 11/11/18.
//  Copyright © 2018 gtech. All rights reserved.
//

/*
 To - Do
 
  Organize Code
 
 */

import UIKit
import AVFoundation

class ViewController: UIViewController, UITextFieldDelegate {
    
    var subtractScore : Int = 1
    var subtractMistakesLeftScore : Int = 3
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var mistakesLeftLabel: UILabel!
    
    @IBOutlet weak var operation: UIButton!
    
    var activeTextField = UITextField()
    
    @IBOutlet weak var newVal1: UITextField!
    @IBOutlet weak var newVal2: UITextField!
    @IBOutlet weak var newVal3: UITextField!
    @IBOutlet weak var newVal4: UITextField!
    
    @IBOutlet weak var numBtn1: UILabel!
    @IBOutlet weak var numBtn2: UILabel!
    @IBOutlet weak var numBtn3: UILabel!
    @IBOutlet weak var numBtn4: UILabel!
    @IBOutlet weak var numBtn5: UILabel!
    @IBOutlet weak var numBtn6: UILabel!
    
    var slashMark6 : UIImageView = UIImageView()
    var slashMark5 : UIImageView = UIImageView()
    var slashMark4 : UIImageView = UIImageView()
    var slashMark3 : UIImageView = UIImageView()
    var slashMark2 : UIImageView = UIImageView()
    var slashMark1 : UIImageView = UIImageView()
    var slashMarkNV1 : UIImageView = UIImageView()
    var slashMarkNV2 : UIImageView = UIImageView()
    var slashMarkNV3 : UIImageView = UIImageView()
    var slashMarkNV4 : UIImageView = UIImageView()
    
    @IBOutlet weak var input1: UITextField!
    @IBOutlet weak var input2: UITextField!
    @IBOutlet weak var input3: UITextField!
    
    @IBOutlet weak var solutionFeedback: UILabel!
    
    @IBOutlet weak var column1: UIView!
    @IBOutlet weak var column2: UIView!
    @IBOutlet weak var column3: UIView!
    
    @IBOutlet weak var column1Height: NSLayoutConstraint!
    @IBOutlet weak var column2Height: NSLayoutConstraint!
    @IBOutlet weak var column3Height: NSLayoutConstraint!
    
    // The character imageView
    @IBOutlet weak var character: UIImageView!
    
    // Character's Invisible cloaks
    @IBOutlet weak var topCloak: UIImageView!
    @IBOutlet weak var middleCloak: UIImageView!
    
    // Character's position (constraint from top to superview)
    let hidingAtTopLvl : CGFloat = 258
    let hidingAtMiddleLvl : CGFloat = 299
    let hidingAtBottomLvl : CGFloat = 385
    @IBOutlet weak var characterPosition: NSLayoutConstraint!
    
    // Top number
    var number5 : Int = 3
    var number3 : Int = 6 // branch a/d = 0, branch b = 1, branch c/e = 6
    var number1 : Int = 8 // branch a-c = 7, branch d-e = 8

    // Bottom number
    var number6 : Int = 2
    var number4 : Int = 5
    var number2 : Int = 8

    @IBOutlet weak var nextBtn: UIButton!
    
    var peekPlayer : AVAudioPlayer = AVAudioPlayer()
    var hidePlayer : AVAudioPlayer = AVAudioPlayer()
    var showPlayer : AVAudioPlayer = AVAudioPlayer()
    var wrongPlayer : AVAudioPlayer = AVAudioPlayer()
    var correctPlayer : AVAudioPlayer = AVAudioPlayer()
    
    let orange : UIColor = UIColor(red: 247/255, green: 169/255, blue: 65/255, alpha: 1.0)
    let red : UIColor = UIColor(red: 233/255, green: 56/255, blue: 61/255, alpha: 1.0)
    let green : UIColor = UIColor(red: 80/255, green: 173/255, blue: 85/255, alpha: 1.0)
    let gray : UIColor = UIColor(red: 34/255, green: 34/255, blue: 34/255, alpha: 1.0)
    
    var branchA : Bool = false
    var branchB : Bool = false
    var branchC : Bool = false
    var branchD : Bool = false
    var branchE : Bool = false
    
    var numBtn6WrongSwipe = UIViewPropertyAnimator()
    var numBtn5WrongSwipe = UIViewPropertyAnimator()
    var numBtn4WrongSwipe = UIViewPropertyAnimator()
    var numBtn3WrongSwipe = UIViewPropertyAnimator()
    var numBtn2WrongSwipe = UIViewPropertyAnimator()
    var numBtn1WrongSwipe = UIViewPropertyAnimator()
    
    var newVal4CorrectTextField = UIViewPropertyAnimator()
    var newVal3CorrectTextField = UIViewPropertyAnimator()
    var newVal2CorrectTextField = UIViewPropertyAnimator()
    var newVal1CorrectTextField = UIViewPropertyAnimator()
    var newVal1WrongSwipe = UIViewPropertyAnimator()
    var newVal2WrongSwipe = UIViewPropertyAnimator()
    var newVal3WrongSwipe = UIViewPropertyAnimator()
    var newVal4WrongSwipe = UIViewPropertyAnimator()
    
    var animateCharacterPeek = UIViewPropertyAnimator()
    var animateHideCharacter = UIViewPropertyAnimator()
    var animateShowCharacter = UIViewPropertyAnimator()
    
    var newVal4KeyboardShouldResign : Bool = false
    var newVal1KeyboardShouldResign : Bool = false
    var newVal3KeyboardShouldResign : Bool = false
    var newVal2KeyboardShouldResign : Bool = false
    
    var numBtn6RSwipe: UISwipeGestureRecognizer = UISwipeGestureRecognizer()
    var numBtn5RSwipe: UISwipeGestureRecognizer = UISwipeGestureRecognizer()
    var numBtn4RSwipe: UISwipeGestureRecognizer = UISwipeGestureRecognizer()
    var numBtn3RSwipe: UISwipeGestureRecognizer = UISwipeGestureRecognizer()
    var numBtn2RSwipe: UISwipeGestureRecognizer = UISwipeGestureRecognizer()
    var numBtn1RSwipe: UISwipeGestureRecognizer = UISwipeGestureRecognizer()
    var numBtn6LSwipe: UISwipeGestureRecognizer = UISwipeGestureRecognizer()
    var numBtn5LSwipe: UISwipeGestureRecognizer = UISwipeGestureRecognizer()
    var numBtn4LSwipe: UISwipeGestureRecognizer = UISwipeGestureRecognizer()
    var numBtn3LSwipe: UISwipeGestureRecognizer = UISwipeGestureRecognizer()
    var numBtn2LSwipe: UISwipeGestureRecognizer = UISwipeGestureRecognizer()
    var numBtn1LSwipe: UISwipeGestureRecognizer = UISwipeGestureRecognizer()
    var newVal4RSwipe: UISwipeGestureRecognizer = UISwipeGestureRecognizer()
    var newVal3RSwipe: UISwipeGestureRecognizer = UISwipeGestureRecognizer()
    var newVal2RSwipe: UISwipeGestureRecognizer = UISwipeGestureRecognizer()
    var newVal1RSwipe: UISwipeGestureRecognizer = UISwipeGestureRecognizer()
    var newVal4LSwipe: UISwipeGestureRecognizer = UISwipeGestureRecognizer()
    var newVal3LSwipe: UISwipeGestureRecognizer = UISwipeGestureRecognizer()
    var newVal2LSwipe: UISwipeGestureRecognizer = UISwipeGestureRecognizer()
    var newVal1LSwipe: UISwipeGestureRecognizer = UISwipeGestureRecognizer()
    
    let peekDelay = 1.0
    let hideDelay = 2.2
    let showDelay = 0.2
    /////////////////////////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////////////////////////
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        column1Height.constant = 270
        column1.updateConstraints()
        column2Height.constant = 270
        column2.updateConstraints()
        column3Height.constant = 270
        column3.updateConstraints()

        column1.backgroundColor = UIColor.clear
        column2.backgroundColor = UIColor.clear
        column3.backgroundColor = UIColor.clear
        
        // remove red background to allow CGColor animations to show.
        newVal1.backgroundColor = UIColor.clear
        newVal2.backgroundColor = UIColor.clear
        newVal3.backgroundColor = UIColor.clear
        newVal4.backgroundColor = UIColor.clear
        input1.backgroundColor = UIColor.clear
        input2.backgroundColor = UIColor.clear
        input3.backgroundColor = UIColor.clear
        
        // TextField delegates
        newVal1.delegate = self
        newVal3.delegate = self
        newVal4.delegate = self
        newVal2.delegate = self
        input1.delegate = self
        input2.delegate = self
        input3.delegate = self
        
        slashMark6 = UIImageView(frame: CGRect(x: 10, y: 0, width: self.numBtn3.frame.width-20, height: self.numBtn3.frame.height) )
        slashMark6.image = UIImage(named: "line")
        slashMark6.contentMode = .scaleAspectFit
        
        slashMark5 = UIImageView(frame: CGRect(x: 10, y: 0, width: self.numBtn3.frame.width-20, height: self.numBtn3.frame.height) )
        slashMark5.image = UIImage(named: "line")
        slashMark5.contentMode = .scaleAspectFit
        slashMark5.tag = 100
        
        slashMark4 = UIImageView(frame: CGRect(x: 10, y: 0, width: self.numBtn3.frame.width-20, height: self.numBtn3.frame.height) )
        slashMark4.image = UIImage(named: "line")
        slashMark4.contentMode = .scaleAspectFit
        
        slashMark3 = UIImageView(frame: CGRect(x: 10, y: 0, width: self.numBtn3.frame.width-20, height: self.numBtn3.frame.height) )
        slashMark3.image = UIImage(named: "line")
        slashMark3.contentMode = .scaleAspectFit
        slashMark3.tag = 100
        
        slashMark2 = UIImageView(frame: CGRect(x: 10, y: 0, width: self.numBtn3.frame.width-20, height: self.numBtn3.frame.height) )
        slashMark2.image = UIImage(named: "line")
        slashMark2.contentMode = .scaleAspectFit
        
        slashMark1 = UIImageView(frame: CGRect(x: 10, y: 0, width: self.numBtn3.frame.width-20, height: self.numBtn3.frame.height) )
        slashMark1.image = UIImage(named: "line")
        slashMark1.contentMode = .scaleAspectFit
        slashMark1.tag = 100
        
        slashMarkNV1 = UIImageView(frame: CGRect(x: 10, y: 0, width: self.numBtn3.frame.width-20, height: self.numBtn3.frame.height) )
        slashMarkNV1.image = UIImage(named: "line")
        slashMarkNV1.contentMode = .scaleAspectFit
        slashMarkNV1.tag = 100
        
        slashMarkNV2 = UIImageView(frame: CGRect(x: 10, y: 0, width: self.numBtn3.frame.width-20, height: self.numBtn3.frame.height) )
        slashMarkNV2.image = UIImage(named: "line")
        slashMarkNV2.contentMode = .scaleAspectFit
        
        slashMarkNV3 = UIImageView(frame: CGRect(x: 10, y: 0, width: self.numBtn3.frame.width-20, height: self.numBtn3.frame.height) )
        slashMarkNV3.image = UIImage(named: "line")
        slashMarkNV3.contentMode = .scaleAspectFit
        
        slashMarkNV4 = UIImageView(frame: CGRect(x: 10, y: 0, width: self.numBtn3.frame.width-20, height: self.numBtn3.frame.height) )
        slashMarkNV4.image = UIImage(named: "line")
        slashMarkNV4.contentMode = .scaleAspectFit
        slashMarkNV4.tag = 100
        
        self.numBtn6RSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleNumBtn6Swipe(sender:)))
        self.numBtn6RSwipe.direction = UISwipeGestureRecognizer.Direction.right
        numBtn6.addGestureRecognizer(self.numBtn6RSwipe)
        self.numBtn6LSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleNumBtn6Swipe(sender:)))
        self.numBtn6LSwipe.direction = UISwipeGestureRecognizer.Direction.left
        numBtn6.addGestureRecognizer(self.numBtn6LSwipe)
        
        numBtn5RSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleNumBtn5Swipe(sender:)))
        numBtn5RSwipe.direction = UISwipeGestureRecognizer.Direction.right
        numBtn5.addGestureRecognizer(numBtn5RSwipe)
        numBtn5LSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleNumBtn5Swipe(sender:)))
        numBtn5LSwipe.direction = UISwipeGestureRecognizer.Direction.left
        numBtn5.addGestureRecognizer(numBtn5LSwipe)
        
        numBtn4RSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleNumBtn4Swipe(sender:)))
        numBtn4RSwipe.direction = UISwipeGestureRecognizer.Direction.right
        numBtn4.addGestureRecognizer(numBtn4RSwipe)
        numBtn4LSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleNumBtn4Swipe(sender:)))
        numBtn4LSwipe.direction = UISwipeGestureRecognizer.Direction.left
        numBtn4.addGestureRecognizer(numBtn4LSwipe)
        
        numBtn3RSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleNumBtn3Swipe(sender:)))
        numBtn3RSwipe.direction = UISwipeGestureRecognizer.Direction.right
        numBtn3.addGestureRecognizer(numBtn3RSwipe)
        numBtn3LSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleNumBtn3Swipe(sender:)))
        numBtn3LSwipe.direction = UISwipeGestureRecognizer.Direction.left
        numBtn3.addGestureRecognizer(numBtn3LSwipe)
        
        numBtn2RSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleNumBtn2Swipe(sender:)))
        numBtn2RSwipe.direction = UISwipeGestureRecognizer.Direction.right
        numBtn2.addGestureRecognizer(numBtn2RSwipe)
        numBtn2LSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleNumBtn2Swipe(sender:)))
        numBtn2LSwipe.direction = UISwipeGestureRecognizer.Direction.left
        numBtn2.addGestureRecognizer(numBtn2LSwipe)
        
        numBtn1RSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleNumBtn1Swipe(sender:)))
        numBtn1RSwipe.direction = UISwipeGestureRecognizer.Direction.right
        numBtn1.addGestureRecognizer(numBtn1RSwipe)
        numBtn1LSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleNumBtn1Swipe(sender:)))
        numBtn1LSwipe.direction = UISwipeGestureRecognizer.Direction.left
        numBtn1.addGestureRecognizer(numBtn1LSwipe)
        
        newVal1RSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleNewVal1Swipe(sender:)))
        newVal1RSwipe.direction = UISwipeGestureRecognizer.Direction.right
        newVal1.addGestureRecognizer(newVal1RSwipe)
        newVal1LSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleNewVal1Swipe(sender:)))
        newVal1LSwipe.direction = UISwipeGestureRecognizer.Direction.left
        newVal1.addGestureRecognizer(newVal1LSwipe)
        
        newVal2RSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleNewVal2Swipe(sender:)))
        newVal2RSwipe.direction = UISwipeGestureRecognizer.Direction.right
        newVal2.addGestureRecognizer(newVal2RSwipe)
        newVal2LSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleNewVal2Swipe(sender:)))
        newVal2LSwipe.direction = UISwipeGestureRecognizer.Direction.left
        newVal2.addGestureRecognizer(newVal2LSwipe)
        
        newVal3RSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleNewVal3Swipe(sender:)))
        newVal3RSwipe.direction = UISwipeGestureRecognizer.Direction.right
        newVal3.addGestureRecognizer(newVal3RSwipe)
        newVal3LSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleNewVal3Swipe(sender:)))
        newVal3LSwipe.direction = UISwipeGestureRecognizer.Direction.left
        newVal3.addGestureRecognizer(newVal3LSwipe)
        
        newVal4RSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleNewVal4Swipe(sender:)))
        newVal4RSwipe.direction = UISwipeGestureRecognizer.Direction.right
        newVal4.addGestureRecognizer(newVal4RSwipe)
        newVal4LSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleNewVal4Swipe(sender:)))
        newVal4LSwipe.direction = UISwipeGestureRecognizer.Direction.left
        newVal4.addGestureRecognizer(newVal4LSwipe)
 
        solutionFeedback.isHidden = true
        solutionFeedback.text = ""
        
        do{
            let audioPath = Bundle.main.path(forResource: "comedy_whistle_slide_up_002", ofType: "mp3")
            try self.peekPlayer = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!)as URL)
        }
        catch
        {
            print("Error starting audio player")
        }
        self.peekPlayer.rate = 2
        
        do{
            let audioPath = Bundle.main.path(forResource: "comedy_whistle_slide_down_001", ofType: "mp3")
            try self.hidePlayer = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!)as URL)
        }
        catch
        {
            print("Error starting audio player")
        }
        self.hidePlayer.rate = 2
        
        do{
            let audioPath = Bundle.main.path(forResource: "comedy_whistle_slide_up_001", ofType: "mp3")
            try self.showPlayer = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!)as URL)
        }
        catch
        {
            print("Error starting audio player")
        }
        self.showPlayer.rate = 0.7
        
        do{
            let audioPath = Bundle.main.path(forResource: "wrong", ofType: "mp3")
            try self.wrongPlayer = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!)as URL)
        }
        catch
        {
            print("Error starting audio player")
        }
        self.wrongPlayer.rate = 0.5
        
        do{
            let audioPath = Bundle.main.path(forResource: "correct", ofType: "mp3")
            try self.correctPlayer = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!)as URL)
        }
        catch
        {
            print("Error starting audio player")
        }
        self.correctPlayer.rate = 1
        correctPlayer.enableRate = true
        
        // Start the game
        if(operation.titleLabel?.text == "-")
        {
            subtract()
        }
        else
        {
            add()
        }
    } // End of View Did Load
    /////////////////////////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////////////////////////

    func subtract()
    {
        operation.setTitle("-", for: .normal)
        
        // Reset the board ////////////////////////////////////
        newVal4KeyboardShouldResign = false
        newVal1KeyboardShouldResign = false
        newVal3KeyboardShouldResign = false
        newVal2KeyboardShouldResign = false
        
        // Enable the labels that were possibly crossed out and disabled/grayed out.
        numBtn5.isEnabled = true
        numBtn3.isEnabled = true
        numBtn1.isEnabled = true
        newVal1.isEnabled = true
        
        // Make text white again for the NewVals
        newVal1.textColor = UIColor.white
        newVal2.textColor = UIColor.white
        newVal3.textColor = UIColor.white
        newVal4.textColor = UIColor.white
        
        let viewWithTag1 = numBtn1.viewWithTag(100)
        viewWithTag1?.removeFromSuperview()
        let viewWithTag3 = numBtn3.viewWithTag(100)
        viewWithTag3?.removeFromSuperview()
        let viewWithTag5 = numBtn5.viewWithTag(100)
        viewWithTag5?.removeFromSuperview()
        let viewWithTag7 = newVal1.viewWithTag(100)
        viewWithTag7?.removeFromSuperview()
        
        newVal1.layer.backgroundColor = orange.cgColor
        newVal2.layer.backgroundColor = orange.cgColor
        newVal3.layer.backgroundColor = orange.cgColor
        newVal4.layer.backgroundColor = orange.cgColor
        
        newVal1.text = "?"
        newVal2.text = "?"
        newVal3.text = "?"
        newVal4.text = "?"
        newVal1.isEnabled = false
        newVal2.isEnabled = false
        newVal3.isEnabled = false
        newVal4.isEnabled = false
        newVal1.isHidden = true
        newVal2.isHidden = true
        newVal3.isHidden = true
        newVal4.isHidden = true
        
//        newVal1.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
//        newVal2.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
//        newVal3.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
//        newVal4.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)

        input1.layer.backgroundColor = orange.cgColor
        input2.layer.backgroundColor = orange.cgColor
        input3.layer.backgroundColor = orange.cgColor
        input1.text = "?"
        input2.text = "?"
        input3.text = "?"
        input1.isEnabled = false
        input2.isEnabled = false
        input3.isEnabled = false
        input1.isHidden = true
        input2.isHidden = true
        input3.isHidden = true
//        input1.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
//        input2.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
//        input3.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
        self.numBtn5LSwipe.isEnabled = true
        self.numBtn5RSwipe.isEnabled = true
        self.numBtn3LSwipe.isEnabled = true
        self.numBtn3RSwipe.isEnabled = true
        self.numBtn1LSwipe.isEnabled = true
        self.numBtn1RSwipe.isEnabled = true
        self.newVal1LSwipe.isEnabled = false
        self.newVal1RSwipe.isEnabled = false
        self.newVal2LSwipe.isEnabled = false
        self.newVal2RSwipe.isEnabled = false
        self.newVal3LSwipe.isEnabled = false
        self.newVal3RSwipe.isEnabled = false
        self.newVal4LSwipe.isEnabled = false
        self.newVal4RSwipe.isEnabled = false
        
        branchA = false
        branchB = false
        branchC = false
        branchD = false
        branchE = false
       
        // Start the math steps ////////////////////////////////////////
        if(subtractScore == 1)
        {
            while(branchA == false)
            {
                getNewRandomNumbers()
                branchA = number1 >= number2 && number3 >= number4
            }
        }
        else if(subtractScore == 2)
        {
            while(branchB == false)
            {
                getNewRandomNumbers()
                branchB = number1 >= number2 && number3 < number4
            }
        }
        else if(subtractScore == 3)
        {
            while(branchC == false)
            {
                getNewRandomNumbers()
                branchC = number1 < number2 && number3 > number4
            }
        }
        else if(subtractScore == 4)
        {
            while(branchD == false)
            {
                getNewRandomNumbers()
                branchD = number1 < number2 && number3 <= number4 && number3 != 0
            }
        }
        else if(subtractScore >= 5)
        {
            while(branchE == false)
            {
                getNewRandomNumbers()
                branchE = number1 < number2 && number3 == 0
            }
        }
        
        
        
                // For debugging only. Comment out to re-enable random numbers.
                // Top number
//                number5 = 5; number3 = 0; number1 = 7
//                // Bottom number
//                number6 = 0; number4 = 9; number2 = 6
        
        // Set titles
        numBtn1.text = String(number1)
        numBtn2.text = String(number2)
        numBtn3.text = String(number3)
        numBtn4.text = String(number4)
        numBtn5.text = String(number5)
        numBtn6.text = String(number6)
        
        
        if(branchA)
        {
            input1.isHidden = false
            input1.isEnabled = true
        }
        else if(branchB)
        {
            input1.isHidden = false
            input1.isEnabled = true
        }
        else if(branchC)
        {
            // swipe numBtn3 to continue
        }
        else if(branchD)
        {
            // swipe numBtn3 to continue
        }
        else if(branchE)
        {
            // swipe numBtn5 to continue
        }
  
    } // end of subtract
    
    func decrementMistakesLeft()
    {
        if(subtractMistakesLeftScore == 1)
        {   // RESET
            subtractMistakesLeftScore = 0
            mistakesLeftLabel.text = "Mistakes Left: " + String(subtractMistakesLeftScore)
            // play lost sound
            // then add the following to the completion handler.
            subtractMistakesLeftScore = 3
            mistakesLeftLabel.text = "Mistakes Left: " + String(subtractMistakesLeftScore)
            subtractScore = 1
            scoreLabel.text = "Level: " + String(subtractScore)
            subtract()
            return
        }
        subtractMistakesLeftScore -= 1
        mistakesLeftLabel.text = "Mistakes Left: " + String(subtractMistakesLeftScore)
    }
    
    func getNewRandomNumbers()
    {
        // Random numbers
        number1 = Int.random(in: 0 ... 9)
        number2 = Int.random(in: 0 ... 9)
        number3 = Int.random(in: 0 ... 9)
        number4 = Int.random(in: 0 ... 9)
        number5 = Int.random(in: 0 ... 9)
        number6 = Int.random(in: 0 ... 9)
        
        // Prevent smaller number on top
        var topNumber : String = String(number5)
        topNumber += String(number3)
        topNumber += String(number1)
        let tn = Int(topNumber)
        
        var bottomNumber : String = String(number6)
        bottomNumber += String(number4)
        bottomNumber += String(number2)
        let bn = Int(bottomNumber)
        
        // Switch if needed
        if(tn! < bn!)
        {
            let temp5 : Int = number5
            let temp3 : Int = number3
            let temp1 : Int = number1
            number5 = number6
            number3 = number4
            number1 = number2
            number6 = temp5
            number4 = temp3
            number2 = temp1
        }
    }
    

    // Assign the newly active text field to your activeTextField variable
    func textFieldDidBeginEditing(_ textField: UITextField)
    {
        print("didbeginediting")
        if(textField == input1 || textField == input2 || textField == input3)
        {
            moveTextField(textField, moveDistance: -140, up: true)
        }
        else if(textField.layer.backgroundColor != UIColor.clear.cgColor
            && textField.layer.backgroundColor != green.cgColor)
        {
            moveTextField(textField, moveDistance: -40, up: true)
        }
            
        if(textField == newVal4 && newVal4KeyboardShouldResign)
        {
            newVal4.resignFirstResponder()
            return
        }
        else if(textField == newVal1 && newVal1KeyboardShouldResign)
        {
            newVal1.resignFirstResponder()
            return
        }
        else if(textField == newVal3 && newVal3KeyboardShouldResign)
        {
            newVal3.resignFirstResponder()
            return
        }
        else if(textField == newVal2 && newVal2KeyboardShouldResign)
        {
            newVal2.resignFirstResponder()
            return
        }
        self.activeTextField = textField
        textField.text = ""
        textField.layer.backgroundColor = orange.cgColor
    }
    

    @IBAction func input1EditingDidEnd(_ sender: UITextField)
    {
        print("input1 EditingDidEnd")
        let input = Int(sender.text!)

        // Subtracting
        if(operation.titleLabel?.text == "-")
        {
            print("input1 : subtract if statement")
            //////////////////////////////////////////////////////////
            if(branchA)
            {
                print("input1 : branchA")
                // Check math
                if(input == number1 - number2)
                {
                    correctPlayer.stop()
                    correctPlayer.currentTime = 0
                    self.correctPlayer.play()
                    solutionFeedback.text = "Correct!a1"
                    // Configure input fields
                    input1.layer.backgroundColor = green.cgColor
                    input1.isEnabled = false
                    input2.isHidden = false
                    input2.isEnabled = true
                }
                else if(input != (number1 - number2) && sender.text != "")
                {
                    wrongPlayer.stop()
                    wrongPlayer.currentTime = 0
                    self.wrongPlayer.play()
                    solutionFeedback.text = "Wrong!a1"
                    sender.layer.backgroundColor = red.cgColor
                    decrementMistakesLeft()
                }
            }
            //////////////////////////////////////////////////////////
            else if(branchB)
            {
                print("input1 : branchB")
                // Check math
                if(input == number1 - number2)
                {
                    correctPlayer.stop()
                    correctPlayer.currentTime = 0
                    self.correctPlayer.play()
                    solutionFeedback.text = "Correct!b1"
                    // Configure input fields
                    input1.layer.backgroundColor = green.cgColor
                    input1.isEnabled = false
                    // Enable numBtn5 swipe
                    // *** Do not enable numBtn5 swipe, it's already enabled and always will be,
                    // till it's crossed out correctly.
                }
                else if(input != (number1 - number2) && sender.text != "")
                {
                    wrongPlayer.stop()
                    wrongPlayer.currentTime = 0
                    self.wrongPlayer.play()
                    input1.layer.backgroundColor = red.cgColor
                    solutionFeedback.text = "Wrong!b1"
                    decrementMistakesLeft()
                }
            }
            //////////////////////////////////////////////////////////
            else if(branchC)
            {
                print("input1 : branchC")
                // Check math
                if(input == Int(newVal3.text!)! - number2)
                {
                    correctPlayer.stop()
                    correctPlayer.currentTime = 0
                    self.correctPlayer.play()
                    solutionFeedback.text = "Correct!b1"
                    // Configure input fields
                    input1.layer.backgroundColor = green.cgColor
                    input1.isEnabled = false
                    input2.isHidden = false
                    input2.isEnabled = true
                }
                else if(input != (Int(newVal3.text!)! - number2) && sender.text != "")
                {
                    wrongPlayer.stop()
                    wrongPlayer.currentTime = 0
                    self.wrongPlayer.play()
                    input1.layer.backgroundColor = red.cgColor
                    solutionFeedback.text = "Wrong!b1"
                    decrementMistakesLeft()
                }
            }
            //////////////////////////////////////////////////////////
            else if(branchD)
            {
                print("input1 : branchC")
                // Check math
                if(input == Int(newVal3.text!)! - number2)
                {
                    correctPlayer.stop()
                    correctPlayer.currentTime = 0
                    self.correctPlayer.play()

                    solutionFeedback.text = "Correct!b1"
                    // Configure input fields
                    input1.layer.backgroundColor = green.cgColor
                    input1.isEnabled = false
                }
                else if(input != (Int(newVal3.text!)! - number2) && sender.text != "")
                {
                    wrongPlayer.stop()
                    wrongPlayer.currentTime = 0
                    self.wrongPlayer.play()
                    input1.layer.backgroundColor = red.cgColor
                    solutionFeedback.text = "Wrong!b1"
                    decrementMistakesLeft()
                }
            }
            //////////////////////////////////////////////////////////
            else if(branchE)
            {
                // Check math
                if(input == Int(newVal3.text!)! - number2)
                {
                    correctPlayer.stop()
                    correctPlayer.currentTime = 0
                    self.correctPlayer.play()
                    solutionFeedback.text = "Correct!b1"
                    // Configure input fields
                    input1.layer.backgroundColor = green.cgColor
                    input1.isEnabled = false
                    input2.isHidden = false
                    input2.isEnabled = true
                }
                else if(input != (Int(newVal3.text!)! - number2) && sender.text != "")
                {
                    wrongPlayer.stop()
                    wrongPlayer.currentTime = 0
                    self.wrongPlayer.play()
                    input1.layer.backgroundColor = red.cgColor
                    solutionFeedback.text = "Wrong!b1"
                    decrementMistakesLeft()
                }
            }
        }
    }
    
    @IBAction func input2EditingDidEnd(_ sender: UITextField) {
        print("input2 EditingDidEnd")
        let input = Int(sender.text!)
        
        // Subtracting
        if(operation.titleLabel?.text == "-")
        {
            print("input2 : subtract if statement")
            //////////////////////////////////////////////////////////
            if(branchA)
            {
                print("input2 : branchA")
                // Check math
                if(input == number3 - number4)
                {
                    correctPlayer.stop()
                    correctPlayer.currentTime = 0
                    correctPlayer.play()
                    solutionFeedback.text = "Correct!a2"
                    // Configure input fields
                    input2.layer.backgroundColor = green.cgColor
                    input2.isEnabled = false
                    input3.isHidden = false
                    input3.isEnabled = true
                }
                else if(input != (number3 - number4) && sender.text != "")
                {
                    wrongPlayer.stop()
                    wrongPlayer.currentTime = 0
                    self.wrongPlayer.play()
                    solutionFeedback.text = "Wrong!a2"
                    input2.layer.backgroundColor = red.cgColor
                    decrementMistakesLeft()
                }
            }
                //////////////////////////////////////////////////////////
            else if(branchB)
            {
                print("input2 : branchB")
                // Check math
                if(input == Int(newVal1.text!)! - number4)
                {
                    correctPlayer.stop()
                    correctPlayer.currentTime = 0
                    self.correctPlayer.play()

                    solutionFeedback.text = "Correct!b2"
                    // Configure input fields
                    input2.layer.backgroundColor = green.cgColor
                    input2.isEnabled = false
                    input3.isHidden = false
                    input3.isEnabled = true
                }
                else if(input != (Int(newVal1.text!)! - number4) && sender.text != "")
                {
                    wrongPlayer.stop()
                    wrongPlayer.currentTime = 0
                    self.wrongPlayer.play()
                    solutionFeedback.text = "Wrong!b2"
                    input2.layer.backgroundColor = red.cgColor
                    decrementMistakesLeft()
                }
            }
                //////////////////////////////////////////////////////////
            else if(branchC)
            {
                print("input2 : branchB")
                // Check math
                if(input == Int(newVal1.text!)! - number4)
                {
                    correctPlayer.stop()
                    correctPlayer.currentTime = 0
                    self.correctPlayer.play()
                    solutionFeedback.text = "Correct!b2"
                    // Configure input fields
                    input2.layer.backgroundColor = green.cgColor
                    input2.isEnabled = false
                    input3.isHidden = false
                    input3.isEnabled = true
                }
                else if(input != (Int(newVal1.text!)! - number4) && sender.text != "")
                {
                    wrongPlayer.stop()
                    wrongPlayer.currentTime = 0
                    self.wrongPlayer.play()
                    solutionFeedback.text = "Wrong!b2"
                    input2.layer.backgroundColor = red.cgColor
                    decrementMistakesLeft()
                }
            }
                //////////////////////////////////////////////////////////
            else if(branchD)
            {
                print("input2 : branchB")
                // Check math
                if(input == Int(newVal2.text!)! - number4)
                {
                    correctPlayer.stop()
                    correctPlayer.currentTime = 0
                    self.correctPlayer.play()
                    solutionFeedback.text = "Correct!b2"
                    // Configure input fields
                    input2.layer.backgroundColor = green.cgColor
                    input2.isEnabled = false
                    input3.isHidden = false
                    input3.isEnabled = true
                }
                else if(input != (Int(newVal2.text!)! - number4) && sender.text != "")
                {
                    wrongPlayer.stop()
                    wrongPlayer.currentTime = 0
                    self.wrongPlayer.play()
                    solutionFeedback.text = "Wrong!b2"
                    input2.layer.backgroundColor = red.cgColor
                    decrementMistakesLeft()
                }
            }
                //////////////////////////////////////////////////////////
            else if(branchE)
            {
                // Check math
                if(input == Int(newVal2.text!)! - number4)
                {
                    correctPlayer.stop()
                    correctPlayer.currentTime = 0
                    self.correctPlayer.play()
                    solutionFeedback.text = "Correct!b2"
                    // Configure input fields
                    input2.layer.backgroundColor = green.cgColor
                    input2.isEnabled = false
                    input3.isHidden = false
                    input3.isEnabled = true
                }
                else if(input != (Int(newVal2.text!)! - number4) && sender.text != "")
                {
                    wrongPlayer.stop()
                    wrongPlayer.currentTime = 0
                    self.wrongPlayer.play()
                    solutionFeedback.text = "Wrong!b2"
                    input2.layer.backgroundColor = red.cgColor
                    decrementMistakesLeft()
                }
            }
        }
    }
    
    @IBAction func input3EditingDidEnd(_ sender: UITextField) {
        print("input3 EditingDidEnd")
        let input = Int(sender.text!)
        
        // Subtracting
        if(operation.titleLabel?.text == "-")
        {
            print("input3 : subtract if statement")
            //////////////////////////////////////////////////////////
            if(branchA)
            {
                print("input3 : branchA")
                // Check math
                if(input == number5 - number6)
                {
                    correctPlayer.stop()
                    correctPlayer.currentTime = 0
                    self.correctPlayer.play()
                    solutionFeedback.text = "Correct!a3"
                    // Configure input fields
                    input3.layer.backgroundColor = green.cgColor
                    input3.isEnabled = false
                    nextBtn.isHidden = false
                    nextBtn.isEnabled = true
                }
                else if(input != (number5 - number6) && sender.text != "")
                {
                    wrongPlayer.stop()
                    wrongPlayer.currentTime = 0
                    self.wrongPlayer.play()
                    solutionFeedback.text = "Wrong!a3"
                    input3.layer.backgroundColor = red.cgColor
                    decrementMistakesLeft()
                }
            }
                //////////////////////////////////////////////////////////
            else if(branchB)
            {
                print("input3 : branchB")
                // Check math
                if(input == Int(newVal4.text!)! - number6)
                {
                    correctPlayer.stop()
                    correctPlayer.currentTime = 0
                    self.correctPlayer.play()
    
                    solutionFeedback.text = "Correct!b3"
                    // Configure input fields
                    input3.layer.backgroundColor = green.cgColor
                    input3.isEnabled = false
                    nextBtn.isHidden = false
                    nextBtn.isEnabled = true
                }
                else if(input != (Int(newVal4.text!)! - number6) && sender.text != "")
                {
                    wrongPlayer.stop()
                    wrongPlayer.currentTime = 0
                    self.wrongPlayer.play()
                    solutionFeedback.text = "Wrong!b3"
                    input3.layer.backgroundColor = red.cgColor
                    decrementMistakesLeft()
                }
            }
                //////////////////////////////////////////////////////////
            else if(branchC)
            {
                print("input3 : branchB")
                // Check math
                if(input == number5 - number6)
                {
                    correctPlayer.stop()
                    correctPlayer.currentTime = 0
                    self.correctPlayer.play()
                    solutionFeedback.text = "Correct!b3"
                    // Configure input fields
                    input3.layer.backgroundColor = green.cgColor
                    input3.isEnabled = false
                    nextBtn.isHidden = false
                    nextBtn.isEnabled = true
                }
                else if( (input != number5 - number6) && sender.text != "" )
                {
                    wrongPlayer.stop()
                    wrongPlayer.currentTime = 0
                    self.wrongPlayer.play()
                    solutionFeedback.text = "Wrong!b3"
                    input3.layer.backgroundColor = red.cgColor
                    decrementMistakesLeft()
                }
            }
                //////////////////////////////////////////////////////////
            else if(branchD)
            {
                print("input3 : branchB")
                // Check math
                if(input == Int(newVal4.text!)! - number6)
                {
                    correctPlayer.stop()
                    correctPlayer.currentTime = 0
                    self.correctPlayer.play()
                    solutionFeedback.text = "Correct!b3"
                    // Configure input fields
                    input3.layer.backgroundColor = green.cgColor
                    input3.isEnabled = false
                    nextBtn.isHidden = false
                    nextBtn.isEnabled = true
                }
                else if( (input != Int(newVal4.text!)! - number6) && sender.text != "" )
                {
                    wrongPlayer.stop()
                    wrongPlayer.currentTime = 0
                    self.wrongPlayer.play()
                    solutionFeedback.text = "Wrong!b3"
                    input3.layer.backgroundColor = red.cgColor
                    decrementMistakesLeft()
                }
            }
                //////////////////////////////////////////////////////////
            else if(branchE)
            {
                if(input == Int(newVal4.text!)! - number6)
                {
                    correctPlayer.stop()
                    correctPlayer.currentTime = 0
                    self.correctPlayer.play()
                    solutionFeedback.text = "Correct!b3"
                    // Configure input fields
                    input3.layer.backgroundColor = green.cgColor
                    input3.isEnabled = false
                    nextBtn.isHidden = false
                    nextBtn.isEnabled = true
                }
                else if( (input != Int(newVal4.text!)! - number6) && sender.text != "" )
                {
                    wrongPlayer.stop()
                    wrongPlayer.currentTime = 0
                    self.wrongPlayer.play()
                    solutionFeedback.text = "Wrong!b3"
                    input3.layer.backgroundColor = red.cgColor
                    decrementMistakesLeft()
                }
            }
        }
    }
    
    
    
    
    @IBAction func newVal4EditingDidEnd(_ sender: UITextField) {
        
        print("newVal4 EditingDidEnd")
        let input = Int(sender.text!)
        
        // Subtracting
        if(operation.titleLabel?.text == "-")
        {
            print("newVal4 : subtract if statement")
            //////////////////////////////////////////////////////////
            if(branchA)
            {
                // will never be called here.
            }
            //////////////////////////////////////////////////////////
            else if(branchB)
            {
                print("newVal4 : branchB")
                // Check math : borrow 1
                if(input == number5 - 1)
                {
                    solutionFeedback.text = "Correct!b3"
                    // Configure input fields
                    
                    // If keyboard is still allowed to show up.
                    if(newVal4KeyboardShouldResign == false)
                    {
                        // animate green fade out
                        animateCorrectTextField(textField : sender)
                    }
                    
                    // go to method swipe numBtn3 to make it the next correct swipe.
                }
                else if(input != (number5 - 1) && sender.text != "")
                {
                    wrongPlayer.stop()
                    wrongPlayer.currentTime = 0
                    self.wrongPlayer.play()
                    solutionFeedback.text = "Wrong!b3"
                    newVal4.layer.backgroundColor = red.cgColor
                    decrementMistakesLeft()
                }
            }
                //////////////////////////////////////////////////////////
            else if(branchC)
            {
                
            }
                //////////////////////////////////////////////////////////
            else if(branchD)
            {
                print("newVal4 : branchB")
                // Check math : borrow 1
                if(input == number5 - 1)
                {
                    solutionFeedback.text = "Correct!b3"
                    // Configure input fields
                    
                    // If keyboard is still allowed to show up.
                    if(newVal4KeyboardShouldResign == false)
                    {
                        // animate green fade out
                        animateCorrectTextField(textField : sender)
                    }
                    
                    // go to method swipe numBtn3 to make it the next correct swipe.
                }
                else if(input != (number5 - 1) && sender.text != "")
                {
                    wrongPlayer.stop()
                    wrongPlayer.currentTime = 0
                    self.wrongPlayer.play()
                    solutionFeedback.text = "Wrong!b3"
                    newVal4.layer.backgroundColor = red.cgColor
                    decrementMistakesLeft()
                }
            
            }
                //////////////////////////////////////////////////////////
            else if(branchE)
            {
                print("newVal4 : branchB")
                // Check math : borrow 1
                if(input == number5 - 1)
                {
                    solutionFeedback.text = "Correct!b3"
                    // Configure input fields
                    
                    // If keyboard is still allowed to show up.
                    if(newVal4KeyboardShouldResign == false)
                    {
                        // animate green fade out
                        animateCorrectTextField(textField : sender)
                    }
                    
                    // go to method swipe numBtn3 to make it the next correct swipe.
                }
                else if(input != (number5 - 1) && sender.text != "")
                {
                    wrongPlayer.stop()
                    wrongPlayer.currentTime = 0
                    self.wrongPlayer.play()
                    solutionFeedback.text = "Wrong!b3"
                    newVal4.layer.backgroundColor = red.cgColor
                    decrementMistakesLeft()
                }
            }
        }
        
    }
    
    
    @IBAction func newVal1EditingDidEnd(_ sender: UITextField) {
        print("newVal1 EditingDidEnd")
        let input = Int(sender.text!)
        
        // Subtracting
        if(operation.titleLabel?.text == "-")
        {
            print("newVal1 : subtract if statement")
            //////////////////////////////////////////////////////////
            if(branchA)
            {
                // will never be called here.
            }
                //////////////////////////////////////////////////////////
            else if(branchB)
            {
                print("newVal1 : branchB")
                // Check math : concat 1
                if(input == number3 + 10)
                {
                    solutionFeedback.text = "Correct!b5"
                    // Configure input fields
                    // If keyboard is still allowed to show up after a tap down press.
                    if(newVal1KeyboardShouldResign == false)
                    {
                        newVal1KeyboardShouldResign = true
                        // animate green fade out
                        animateCorrectTextField(textField : sender)
                        
                        input2.isHidden = false
                        input2.isEnabled = true
                    }
                }
                else if(input != (number3 + 10) && sender.text != "")
                {
                    wrongPlayer.stop()
                    wrongPlayer.currentTime = 0
                    self.wrongPlayer.play()
                    solutionFeedback.text = "Wrong!b5"
                    newVal1.layer.backgroundColor = red.cgColor
                    decrementMistakesLeft()
                }
            }
                //////////////////////////////////////////////////////////
            else if(branchC)
            {
                print("newVal1 : branchC")
                // Check math : concat 1
                if(input == number3 - 1)
                {
                    solutionFeedback.text = "Correct!b5"
                    // Configure input fields
                    // If keyboard is still allowed to show up after a tap down press.
                    if(newVal1KeyboardShouldResign == false)
                    {
                        // animate green fade out
                        animateCorrectTextField(textField : sender)
                    }
                }
                else if(input != (number3 - 1) && sender.text != "")
                {
                    wrongPlayer.stop()
                    wrongPlayer.currentTime = 0
                    self.wrongPlayer.play()
                    solutionFeedback.text = "Wrong!b5"
                    newVal1.layer.backgroundColor = red.cgColor
                    decrementMistakesLeft()
                }
            }
                //////////////////////////////////////////////////////////
            else if(branchD)
            {
                print("newVal1 : branchC")
                // Check math : concat 1
                if(input == number3 - 1)
                {
                    solutionFeedback.text = "Correct!b5"
                    // Configure input fields
                    // If keyboard is still allowed to show up after a tap down press.
                    if(newVal1KeyboardShouldResign == false)
                    {
                        // animate green fade out
                        animateCorrectTextField(textField : sender)
                        newVal1KeyboardShouldResign = true
                    }
                }
                else if(input != (number3 - 1) && sender.text != "")
                {
                    wrongPlayer.stop()
                    wrongPlayer.currentTime = 0
                    self.wrongPlayer.play()
                    solutionFeedback.text = "Wrong!b5"
                    newVal1.layer.backgroundColor = red.cgColor
                    decrementMistakesLeft()
                }
            }
                //////////////////////////////////////////////////////////
            else if(branchE)
            {
                print("newVal1 : branchB")
                // Check math : concat 1
                if(input == number3 + 10)
                {
                    solutionFeedback.text = "Correct!b5"
                    // Configure input fields
                    // If keyboard is still allowed to show up after a tap down press.
                    if(newVal1KeyboardShouldResign == false)
                    {
                        newVal1KeyboardShouldResign = true
                        // animate green fade out
                        animateCorrectTextField(textField : sender)
                    }
                }
                else if(input != (number3 + 10) && sender.text != "")
                {
                    wrongPlayer.stop()
                    wrongPlayer.currentTime = 0
                    self.wrongPlayer.play()
                    solutionFeedback.text = "Wrong!b5"
                    newVal1.layer.backgroundColor = red.cgColor
                    decrementMistakesLeft()
                }
            }
        }
    }
    
    @IBAction func newVal3EditingDidEnd(_ sender: UITextField) {
        print("newVal3 EditingDidEnd")
        let input = Int(sender.text!)
        
        // Subtracting
        if(operation.titleLabel?.text == "-")
        {
            print("newVal3 : subtract if statement")
            //////////////////////////////////////////////////////////
            if(branchA)
            {
                // will never be called here.
            }
                //////////////////////////////////////////////////////////
            else if(branchB)
            {
               
            }
                //////////////////////////////////////////////////////////
            else if(branchC)
            {
                print("newVal3 : branchC")
                // Check math : concat 1
                if(input == number1 + 10)
                {
                    solutionFeedback.text = "Correct!b5"
                    // Configure input fields
                    // If keyboard is still allowed to show up after a tap down press.
                    if(newVal3KeyboardShouldResign == false)
                    {
                        // animate green fade out
                        animateCorrectTextField(textField : sender)
                        input1.isHidden = false
                        input1.isEnabled = true
                    }
                }
                else if(input != (number1 + 10) && sender.text != "")
                {
                    wrongPlayer.stop()
                    wrongPlayer.currentTime = 0
                    self.wrongPlayer.play()
                    solutionFeedback.text = "Wrong!b5"
                    newVal3.layer.backgroundColor = red.cgColor
                    decrementMistakesLeft()
                }
            }
                //////////////////////////////////////////////////////////
            else if(branchD)
            {
                print("newVal3 : branchC")
                // Check math : concat 1
                if(input == number1 + 10)
                {
                    solutionFeedback.text = "Correct!b5"
                    // Configure input fields
                    // If keyboard is still allowed to show up after a tap down press.
                    if(newVal3KeyboardShouldResign == false)
                    {
                  
                        // animate green fade out
                        animateCorrectTextField(textField : sender)
                        input1.isHidden = false
                        input1.isEnabled = true
                    }
                }
                else if(input != (number1 + 10) && sender.text != "")
                {
                    wrongPlayer.stop()
                    wrongPlayer.currentTime = 0
                    self.wrongPlayer.play()
                    solutionFeedback.text = "Wrong!b5"
                    newVal3.layer.backgroundColor = red.cgColor
                    decrementMistakesLeft()
                }
            }
                //////////////////////////////////////////////////////////
            else if(branchE)
            {
                // Check math : concat 1
                if(input == number1 + 10)
                {
                    solutionFeedback.text = "Correct!b5"
                    // Configure input fields
                    // If keyboard is still allowed to show up after a tap down press.
                    if(newVal3KeyboardShouldResign == false)
                    {
                        
                        // animate green fade out
                        animateCorrectTextField(textField : sender)
                        input1.isHidden = false
                        input1.isEnabled = true
                    }
                }
                else if(input != (number1 + 10) && sender.text != "")
                {
                    wrongPlayer.stop()
                    wrongPlayer.currentTime = 0
                    self.wrongPlayer.play()
                    solutionFeedback.text = "Wrong!b5"
                    newVal3.layer.backgroundColor = red.cgColor
                    decrementMistakesLeft()
                }
            }
        }
    }
    
    
    
    @IBAction func newVal2EditingDidEnd(_ sender: UITextField) {
        print("newVal3 EditingDidEnd")
        let input = Int(sender.text!)
        
        // Subtracting
        if(operation.titleLabel?.text == "-")
        {
            print("newVal3 : subtract if statement")
            //////////////////////////////////////////////////////////
            if(branchA)
            {
                // will never be called here.
            }
                //////////////////////////////////////////////////////////
            else if(branchB)
            {
                
            }
                //////////////////////////////////////////////////////////
            else if(branchC)
            {

            }
                //////////////////////////////////////////////////////////
            else if(branchD)
            {
                print("newVal3 : branchC")
                // Check math : concat 1
                if(input == Int(newVal1.text!)! + 10)
                {
                    solutionFeedback.text = "Correct!b5"
                    // Configure input fields
                    // If keyboard is still allowed to show up after a tap down press.
                    if(newVal2KeyboardShouldResign == false)
                    {
                        newVal2KeyboardShouldResign = true
                        // animate green fade out
                        animateCorrectTextField(textField : sender)
                        input2.isHidden = false
                        input2.isEnabled = true
                    }
                }
                else if(input != (Int(newVal1.text!)! + 10) && sender.text != "")
                {
                    wrongPlayer.stop()
                    wrongPlayer.currentTime = 0
                    self.wrongPlayer.play()
                    solutionFeedback.text = "Wrong!b5"
                    newVal2.layer.backgroundColor = red.cgColor
                    decrementMistakesLeft()
                }
            }
                //////////////////////////////////////////////////////////
            else if(branchE)
            {
                if(input == Int(newVal1.text!)! - 1)
                {
                    solutionFeedback.text = "Correct!b5"
                    // Configure input fields
                    // If keyboard is still allowed to show up after a tap down press.
                    if(newVal2KeyboardShouldResign == false)
                    {
                        newVal2KeyboardShouldResign = true
                        // animate green fade out
                        animateCorrectTextField(textField : sender)
                    }
                }
                else if(input != (Int(newVal1.text!)! - 1) && sender.text != "")
                {
                    wrongPlayer.stop()
                    wrongPlayer.currentTime = 0
                    self.wrongPlayer.play()
                    solutionFeedback.text = "Wrong!b5"
                    newVal2.layer.backgroundColor = red.cgColor
                    decrementMistakesLeft()
                }
            }
        }
    }
    
    
    func animateCorrectTextField(textField : UITextField)
    { print("animateCorrectTextField")
        self.correctPlayer.stop()
        self.correctPlayer.currentTime = 0
        self.correctPlayer.play()
        
        if(textField == newVal4)
        {
            print("animate green fade out on newVal4 and disable it")
            newVal4KeyboardShouldResign = true // disable further tapdowns.
            newVal4LSwipe.isEnabled = true
            newVal4RSwipe.isEnabled = true
            newVal4.borderStyle = UITextField.BorderStyle.roundedRect
            let fontDesc = input1.font?.fontDescriptor
            newVal4.font = UIFont(descriptor: fontDesc!, size: 50)
            newVal4.textColor = UIColor.black
            newVal4.layer.backgroundColor = green.cgColor
            
            newVal4CorrectTextField = UIViewPropertyAnimator(duration: 4, curve: .easeOut, animations: {
                self.newVal4.layer.backgroundColor = UIColor.clear.cgColor
                // * Very weird fix. NewVal4 and the other textFields keep filling it's backgroundColor after
                //  filling it's layer.backgroundColor
                self.newVal4.backgroundColor = UIColor.clear
            })
            newVal4CorrectTextField.addCompletion { (true) in
                self.newVal4.borderStyle = UITextField.BorderStyle.none
            }
            
            newVal4CorrectTextField.startAnimation()
        }
        else if(textField == newVal1)
        {
            print("animate green fade out on newVal4 and disable it")
            newVal1KeyboardShouldResign = true // disable further tapdowns.
            newVal1LSwipe.isEnabled = true
            newVal1RSwipe.isEnabled = true
            newVal1.borderStyle = UITextField.BorderStyle.roundedRect
            let fontDesc = input1.font?.fontDescriptor
            newVal1.font = UIFont(descriptor: fontDesc!, size: 50)
            newVal1.textColor = UIColor.black
            newVal1.layer.backgroundColor = green.cgColor
            
            newVal1CorrectTextField = UIViewPropertyAnimator(duration: 4, curve: .easeOut, animations: {
                self.newVal1.layer.backgroundColor = UIColor.clear.cgColor
                self.newVal1.backgroundColor = UIColor.clear
            })
            newVal1CorrectTextField.addCompletion { (true) in
                self.newVal1.borderStyle = UITextField.BorderStyle.none
            }
            newVal1CorrectTextField.startAnimation()
        }
        else if(textField == newVal3)
        {
            print("animate green fade out on newVal4 and disable it")
            newVal3KeyboardShouldResign = true // disable further tapdowns.
            newVal3LSwipe.isEnabled = true
            newVal3RSwipe.isEnabled = true
            newVal3.borderStyle = UITextField.BorderStyle.roundedRect
            let fontDesc = input1.font?.fontDescriptor
            newVal3.font = UIFont(descriptor: fontDesc!, size: 50)
            newVal3.textColor = UIColor.black
            newVal3.layer.backgroundColor = green.cgColor
            
            newVal3CorrectTextField = UIViewPropertyAnimator(duration: 4, curve: .easeOut, animations: {
                self.newVal3.layer.backgroundColor = UIColor.clear.cgColor
                self.newVal3.backgroundColor = UIColor.clear
            })
            newVal1CorrectTextField.addCompletion { (true) in
                self.newVal3.borderStyle = UITextField.BorderStyle.none
            }
            newVal3CorrectTextField.startAnimation()
        }
        else if(textField == newVal2)
        {
            print("animate green fade out on newVal4 and disable it")
            newVal2KeyboardShouldResign = true // disable further tapdowns.
            newVal2LSwipe.isEnabled = true
            newVal2RSwipe.isEnabled = true
            newVal2.borderStyle = UITextField.BorderStyle.roundedRect
            let fontDesc = input1.font?.fontDescriptor
            newVal2.font = UIFont(descriptor: fontDesc!, size: 50)
            newVal2.textColor = UIColor.black
            newVal2.layer.backgroundColor = green.cgColor
            
            newVal2CorrectTextField = UIViewPropertyAnimator(duration: 4, curve: .easeOut, animations: {
                self.newVal2.layer.backgroundColor = UIColor.clear.cgColor
                self.newVal2.backgroundColor = UIColor.clear
            })
            newVal2CorrectTextField.addCompletion { (true) in
                self.newVal2.borderStyle = UITextField.BorderStyle.none
            }
            newVal2CorrectTextField.startAnimation()
        }
    }
    
    func animateWrongSwipe(textField : UITextField)
    {
        decrementMistakesLeft()
        
        self.wrongPlayer.stop()
        self.wrongPlayer.currentTime = 0
        self.wrongPlayer.play()
        
        if(textField == newVal4)
        {
            newVal4CorrectTextField.stopAnimation(true)
            newVal4WrongSwipe.stopAnimation(true)
            newVal4.layer.backgroundColor = red.cgColor
            
            slashMarkNV4.alpha = 1 // in case this method is called again b4 it finishes animation.
            newVal4.addSubview(slashMarkNV4)
            newVal4WrongSwipe = UIViewPropertyAnimator(duration: 4, curve: .easeOut, animations: {
                self.newVal4.layer.backgroundColor = UIColor.clear.cgColor
                self.slashMarkNV4.alpha = 0.0
            })
            newVal4WrongSwipe.addCompletion {_ in
                self.slashMarkNV4.removeFromSuperview()
                self.slashMarkNV4.alpha = 1 // to prepare it for the outside world
                self.newVal4.borderStyle = UITextField.BorderStyle.none
            }
            newVal4WrongSwipe.startAnimation()
        }
        else if(textField == newVal3)
        {
            newVal3CorrectTextField.stopAnimation(true)
            newVal3WrongSwipe.stopAnimation(true)
            newVal3.layer.backgroundColor = red.cgColor
            
            slashMarkNV3.alpha = 1 // in case this method is called again b4 it finishes animation.
            newVal3.addSubview(slashMarkNV3)
            newVal3WrongSwipe = UIViewPropertyAnimator(duration: 4, curve: .easeOut, animations: {
                self.newVal3.layer.backgroundColor = UIColor.clear.cgColor
                self.slashMarkNV3.alpha = 0.0
            })
            newVal3WrongSwipe.addCompletion {_ in
                self.slashMarkNV3.removeFromSuperview()
                self.slashMarkNV3.alpha = 1 // to prepare it for the outside world
                self.newVal3.borderStyle = UITextField.BorderStyle.none
            }
            newVal3WrongSwipe.startAnimation()
        }
        else if(textField == newVal2)
        {
            newVal2CorrectTextField.stopAnimation(true)
            newVal2WrongSwipe.stopAnimation(true)
            newVal2.layer.backgroundColor = red.cgColor
            
            slashMarkNV2.alpha = 1 // in case this method is called again b4 it finishes animation.
            newVal2.addSubview(slashMarkNV2)
            newVal2WrongSwipe = UIViewPropertyAnimator(duration: 4, curve: .easeOut, animations: {
                self.newVal2.layer.backgroundColor = UIColor.clear.cgColor
                self.slashMarkNV2.alpha = 0.0
            })
            newVal2WrongSwipe.addCompletion {_ in
                self.slashMarkNV2.removeFromSuperview()
                self.slashMarkNV2.alpha = 1 // to prepare it for the outside world
                self.newVal2.borderStyle = UITextField.BorderStyle.none
            }
            newVal2WrongSwipe.startAnimation()
        }
        else if(textField == newVal1)
        {
            newVal1CorrectTextField.stopAnimation(true)
            newVal1WrongSwipe.stopAnimation(true)
            newVal1.layer.backgroundColor = red.cgColor
            
            slashMarkNV1.alpha = 1 // in case this method is called again b4 it finishes animation.
            newVal1.addSubview(slashMarkNV1)
            newVal1WrongSwipe = UIViewPropertyAnimator(duration: 4, curve: .easeOut, animations: {
                self.newVal1.layer.backgroundColor = UIColor.clear.cgColor
                self.slashMarkNV1.alpha = 0.0
            })
            newVal1WrongSwipe.addCompletion {_ in
                self.slashMarkNV1.removeFromSuperview()
                self.slashMarkNV1.alpha = 1 // to prepare it for the outside world
                self.newVal1.borderStyle = UITextField.BorderStyle.none
            }
            newVal1WrongSwipe.startAnimation()
        }
    }
    

    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touches began")
        activeTextField.resignFirstResponder()
        if(activeTextField.text == "")
        {
            activeTextField.text = "?"
            activeTextField.layer.backgroundColor = orange.cgColor
        }
        if(activeTextField == input1 || activeTextField == input2 || activeTextField == input3)
        {
            moveTextField(activeTextField, moveDistance: -140, up: false)
        }
        else if(activeTextField == newVal4
            || activeTextField == newVal1
            || activeTextField == newVal3
            || activeTextField == newVal2)
        {
            moveTextField(activeTextField, moveDistance: -40, up: false)
        }
        activeTextField = UITextField()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("should return")
        textField.resignFirstResponder()
        if(textField.text == "")
        {
            textField.text = "?"
            textField.layer.backgroundColor = orange.cgColor
        }
        if(textField == input1 || textField == input2 || textField == input3)
        {
            moveTextField(activeTextField, moveDistance: -140, up: false)
        }
        else if(activeTextField == newVal4
            || activeTextField == newVal1
            || activeTextField == newVal3
            || activeTextField == newVal2)
        {
            moveTextField(activeTextField, moveDistance: -40, up: false)
        }
        activeTextField = UITextField()
        return true
    }

//    @objc func textFieldDidChange(_ textField: UITextField) {
//        if(textField.text == "")
//        {
//            textField.backgroundColor = orange
//        }
//    }
    
    // Move the text field with animation
    func moveTextField(_ textField: UITextField, moveDistance: Int, up: Bool) {
        let moveDuration = 0.5
        let movement: CGFloat = CGFloat(up ? moveDistance : -moveDistance)
        
        UIView.beginAnimations("animateTextField", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(moveDuration)
        self.view.frame = self.view.frame.offsetBy(dx: 0, dy: movement)
        UIView.commitAnimations()
    }
    
    
    
    /////////////////////////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////////////////////////
    // Handle Swipes

    
    @objc func handleNumBtn6Swipe(sender: UISwipeGestureRecognizer)
    {
        print("numbtn6 swipe")
        //animateWrongSwipe(label: numBtn4)
        // Subtracting
        if(operation.titleLabel?.text == "-")
        {
            // always wrong to swipe this
            animateWrongSwipe(label: numBtn6)
        }
    }
    
    @objc func handleNumBtn5Swipe(sender: UISwipeGestureRecognizer)
    {
         print("numbtn5 swipe")
        // Subtracting
        if(operation.titleLabel?.text == "-")
        {
            //////////////////////////////////////////////////////////
            if(branchA)
            {
                animateWrongSwipe(label: numBtn5)
            }
            //////////////////////////////////////////////////////////
            else if(branchB)
            {
                // if your even supposed to swipe this yet...
                if(input1.layer.backgroundColor == green.cgColor
                    && newVal4.isHidden)
                {
                    correctPlayer.stop()
                    correctPlayer.currentTime = 0
                    self.correctPlayer.play()
                    solutionFeedback.text = ("correct b2!")
                    // make numBtn5 gray nd use this as a flag when needed.
                    self.numBtn5.isEnabled = false
                    self.numBtn5LSwipe.isEnabled = false
                    self.numBtn5RSwipe.isEnabled = false
                    // Set slash mark
                    self.numBtn5.addSubview(slashMark5)
                    // Get the newVal4 by subtracting by 1
                    self.newVal4.isHidden = false
                    //self.newVal4.text = "?"
                    self.newVal4.isEnabled = true
                }
                else // animate red fade and slashmark fade and decrease mistakes left
                {
                    animateWrongSwipe(label : numBtn5)
                    solutionFeedback.text = ("wrong b2!")
                }
            }
            //////////////////////////////////////////////////////////
            else if(branchC)
            {
                animateWrongSwipe(label: numBtn5)
            }
            //////////////////////////////////////////////////////////
            else if(branchD)
            {
                // if your even supposed to swipe this yet...
                if(input1.layer.backgroundColor == green.cgColor
                    && newVal4.isHidden)
                {
                    correctPlayer.stop()
                    correctPlayer.currentTime = 0
                    self.correctPlayer.play()
                    solutionFeedback.text = ("correct b2!")
                    // make numBtn5 gray nd use this as a flag when needed.
                    self.numBtn5.isEnabled = false
                    self.numBtn5LSwipe.isEnabled = false
                    self.numBtn5RSwipe.isEnabled = false
                    // Set slash mark
                    self.numBtn5.addSubview(slashMark5)
                    // Get the newVal4 by subtracting by 1
                    self.newVal4.isHidden = false
                    //self.newVal4.text = "?"
                    self.newVal4.isEnabled = true
                }
                else // animate red fade and slashmark fade and decrease mistakes left
                {
                    animateWrongSwipe(label : numBtn5)
                    solutionFeedback.text = ("wrong b2!")
                }
            }
            //////////////////////////////////////////////////////////
            else if(branchE)
            {
                correctPlayer.stop()
                correctPlayer.currentTime = 0
                self.correctPlayer.play()
                    self.numBtn5.isEnabled = false
                    self.numBtn5LSwipe.isEnabled = false
                    self.numBtn5RSwipe.isEnabled = false
                    // Set slash mark
                    self.numBtn5.addSubview(slashMark5)
                    // Get the newVal4 by subtracting by 1
                    self.newVal4.isHidden = false
                    //self.newVal4.text = "?"
                    self.newVal4.isEnabled = true
                
            }
        }
    }


    
    @objc func handleNumBtn4Swipe(sender: UISwipeGestureRecognizer)
    {
        print("numbtn4 swipe")
        // Subtracting
        if(operation.titleLabel?.text == "-")
        {          // it's always wrong to swipe this
                animateWrongSwipe(label: numBtn4)
        }
    }
    
    
    @objc func handleNumBtn3Swipe(sender: UISwipeGestureRecognizer)
    {
        print("numbtn3 swipe")
        // Subtracting
        if(operation.titleLabel?.text == "-")
        {
            //////////////////////////////////////////////////////////
            if(branchA)
            {
                animateWrongSwipe(label: numBtn3)
            }
                //////////////////////////////////////////////////////////
            else if(branchB)
            {
                // if your even supposed to swipe this yet...
                if(newVal4.isHidden == false
                    && newVal4.layer.backgroundColor != orange.cgColor
                    && newVal4.layer.backgroundColor != red.cgColor
                    && newVal1.isHidden)
                {
                    correctPlayer.stop()
                    correctPlayer.currentTime = 0
                    self.correctPlayer.play()
                    print("correct b4!")
                    // make numBtn3 gray nd use this as a flag when needed.
                    numBtn3.isEnabled = false
                    self.numBtn3RSwipe.isEnabled = false
                    self.numBtn3LSwipe.isEnabled = false
                    // Set slash mark
                    self.numBtn3.addSubview(slashMark3)
                    // Get the newVal1 by subtracting by 1
                    self.newVal1.isHidden = false
                    self.newVal1.isEnabled = true
                }
                else // animate red fade and slashmark fade and decrease mistakes left
                {
                    animateWrongSwipe(label : numBtn3)
                    print("wrong b4!")
                }
            }
                //////////////////////////////////////////////////////////
            else if(branchC)
            {
                if(newVal1.isHidden)
                {
                    correctPlayer.stop()
                    correctPlayer.currentTime = 0
                    self.correctPlayer.play()
                    numBtn3.isEnabled = false
                    self.numBtn3RSwipe.isEnabled = false
                    self.numBtn3LSwipe.isEnabled = false
                    // Set slash mark
                    self.numBtn3.addSubview(slashMark3)
                    // Get the newVal1 by subtracting by 1
                    self.newVal1.isHidden = false
                    self.newVal1.isEnabled = true
                }
            }
                //////////////////////////////////////////////////////////
            else if(branchD)
            {
                if(newVal1.isHidden)
                {
                    correctPlayer.stop()
                    correctPlayer.currentTime = 0
                    self.correctPlayer.play()
                    numBtn3.isEnabled = false
                    self.numBtn3RSwipe.isEnabled = false
                    self.numBtn3LSwipe.isEnabled = false
                    // Set slash mark
                    self.numBtn3.addSubview(slashMark3)
                    // Get the newVal1 by subtracting by 1
                    self.newVal1.isHidden = false
                    self.newVal1.isEnabled = true
                }
            }
                //////////////////////////////////////////////////////////
            else if(branchE)
            {
                // if your even supposed to swipe this yet...
                if(newVal4.isHidden == false
                    && newVal4.layer.backgroundColor != orange.cgColor
                    && newVal4.layer.backgroundColor != red.cgColor
                    && newVal1.isHidden)
                {
                    correctPlayer.stop()
                    correctPlayer.currentTime = 0
                    self.correctPlayer.play()
                    print("correct b4!")
                    // make numBtn3 gray nd use this as a flag when needed.
                    numBtn3.isEnabled = false
                    self.numBtn3RSwipe.isEnabled = false
                    self.numBtn3LSwipe.isEnabled = false
                    // Set slash mark
                    self.numBtn3.addSubview(slashMark3)
                    // Get the newVal1 by subtracting by 1
                    self.newVal1.isHidden = false
                    self.newVal1.isEnabled = true
                }
                else // animate red fade and slashmark fade and decrease mistakes left
                {
                    animateWrongSwipe(label : numBtn3)
                    print("wrong b4!")
                }
            }
        }
    }
    @objc func handleNumBtn2Swipe(sender: UISwipeGestureRecognizer)
    {
        print("numbtn2 swipe")
        // Subtracting
        if(operation.titleLabel?.text == "-")
        {
            // it's always wrong to swipe this
            animateWrongSwipe(label: numBtn2)
        }
    }
    @objc func handleNumBtn1Swipe(sender: UISwipeGestureRecognizer)
    {
        print("numbtn1 swipe")
        // Subtracting
        if(operation.titleLabel?.text == "-")
        {
            //////////////////////////////////////////////////////////
            if(branchA)
            {
                animateWrongSwipe(label: numBtn1)
            }
                //////////////////////////////////////////////////////////
            else if(branchB)
            {
                animateWrongSwipe(label: numBtn1)
            }
                //////////////////////////////////////////////////////////
            else if(branchC)
            {
                if(newVal1.isHidden == false
                    && newVal1.layer.backgroundColor != orange.cgColor
                    && newVal1.layer.backgroundColor != red.cgColor)
                {
                    correctPlayer.stop()
                    correctPlayer.currentTime = 0
                    self.correctPlayer.play()
                   numBtn1.addSubview(slashMark1)
                    numBtn1LSwipe.isEnabled = false
                    numBtn1RSwipe.isEnabled = false
                     numBtn1.isEnabled = false
                    newVal3.isHidden = false
                    newVal3.isEnabled = true
                }
                else
                {
                    animateWrongSwipe(label: numBtn1)
                }
            }
                //////////////////////////////////////////////////////////
            else if(branchD)
            {
                if(newVal1.isHidden == false
                    && newVal1.layer.backgroundColor != orange.cgColor
                    && newVal1.layer.backgroundColor != red.cgColor)
                {
                    correctPlayer.stop()
                    correctPlayer.currentTime = 0
                    self.correctPlayer.play()
                    numBtn1.isEnabled = false
                    numBtn1LSwipe.isEnabled = false
                    numBtn1RSwipe.isEnabled = false
                    numBtn1.addSubview(slashMark1)
                    newVal3.isHidden = false
                    newVal3.isEnabled = true
                }
                else
                {
                    animateWrongSwipe(label: numBtn1)
                }
            }
                //////////////////////////////////////////////////////////
            else if(branchE)
            {
                if(newVal2.isHidden == false
                    && newVal2.layer.backgroundColor != orange.cgColor
                    && newVal2.layer.backgroundColor != red.cgColor)
                {
                    correctPlayer.stop()
                    correctPlayer.currentTime = 0
                    self.correctPlayer.play()
                    numBtn1.isEnabled = false
                    numBtn1LSwipe.isEnabled = false
                    numBtn1RSwipe.isEnabled = false
                    numBtn1.addSubview(slashMark1)
                    newVal3.isHidden = false
                    newVal3.isEnabled = true
                }
                else
                {
                    animateWrongSwipe(label: numBtn1)
                }
            }
        }
    }
    @objc func handleNewVal1Swipe(sender: UISwipeGestureRecognizer)
    {
        print("newVal1 swipe")
        // Subtracting
        if(operation.titleLabel?.text == "-")
        {
            //////////////////////////////////////////////////////////
            if(branchA)
            {
                // Not even needed; this will be hidden and disabled.
            }
                //////////////////////////////////////////////////////////
            else if(branchB)
            {
                // This should never be swiped
                animateWrongSwipe(textField: newVal1)
            }
                //////////////////////////////////////////////////////////
            else if(branchC)
            {
                // This should never be swiped
                animateWrongSwipe(textField: newVal1)
            }
                //////////////////////////////////////////////////////////
            else if(branchD)
            {
                if(newVal4.isHidden == false
                    && newVal4.layer.backgroundColor != orange.cgColor
                    && newVal4.layer.backgroundColor != red.cgColor)
                {
                    correctPlayer.stop()
                    correctPlayer.currentTime = 0
                    self.correctPlayer.play()
                    // show field above newVal1.
                    newVal1.addSubview(slashMarkNV1)
                    newVal1.bringSubviewToFront(slashMarkNV1)
                    newVal1.textColor = UIColor.init(red: 143/255, green: 143/255, blue: 143/255, alpha: 1)
                    newVal1LSwipe.isEnabled = false
                    newVal1RSwipe.isEnabled = false
                    newVal1.isEnabled = false
                    newVal2.isHidden = false
                    newVal2.isEnabled = true
                }
                else
                {
                    animateWrongSwipe(textField: newVal1)
                }
                
            }
                //////////////////////////////////////////////////////////
            else if(branchE)
            {
                if(newVal2.isHidden
                    && newVal1.layer.backgroundColor != orange.cgColor
                    && newVal1.layer.backgroundColor != red.cgColor)
                {
                    correctPlayer.stop()
                    correctPlayer.currentTime = 0
                    self.correctPlayer.play()
                    // show field above newVal1.
                    newVal1.addSubview(slashMarkNV1)
                    newVal1.bringSubviewToFront(slashMarkNV1)
                    newVal1.textColor = UIColor.init(red: 143/255, green: 143/255, blue: 143/255, alpha: 1)
                    newVal1LSwipe.isEnabled = false
                    newVal1RSwipe.isEnabled = false
                    newVal1.isEnabled = false
                    newVal2.isHidden = false
                    newVal2.isEnabled = true
                }
                else
                {
                    animateWrongSwipe(textField: newVal1)
                }
            }
        }
    }
    
    @objc func handleNewVal2Swipe(sender: UISwipeGestureRecognizer)
    {
        print("newVal2 swipe")
        // Subtracting
        if(operation.titleLabel?.text == "-")
        {
            // it's always wrong to swipe this
            animateWrongSwipe(textField : newVal2)
        }
    }
    
    @objc func handleNewVal3Swipe(sender: UISwipeGestureRecognizer)
    {
        print("newVal3 swipe")
        // Subtracting
        if(operation.titleLabel?.text == "-")
        {
            // it's always wrong to swipe this
            animateWrongSwipe(textField : newVal3)
        }
    }
    
    @objc func handleNewVal4Swipe(sender: UISwipeGestureRecognizer)
    {
        print("newVal4 swipe")
        // Subtracting
        if(operation.titleLabel?.text == "-")
        {
            // it's always wrong to swipe this
            animateWrongSwipe(textField : newVal4)
        }
    }


    // End of handle Swipes
    /////////////////////////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////////////////////////


    func animateWrongSwipe(label : UILabel)
    {   decrementMistakesLeft()
        
        self.wrongPlayer.stop()
        self.wrongPlayer.currentTime = 0
        self.wrongPlayer.play()
        
        if(label == numBtn6)
        {
            numBtn6WrongSwipe.stopAnimation(true)
            numBtn6.layer.backgroundColor = red.cgColor
            
            slashMark6.alpha = 1 // in case this method is called again b4 it finishes animation.
            numBtn6.addSubview(slashMark6)
            numBtn6WrongSwipe = UIViewPropertyAnimator(duration: 4, curve: .easeOut, animations: {
                self.numBtn6.layer.backgroundColor = UIColor.clear.cgColor
                self.slashMark6.alpha = 0
            })
            numBtn6WrongSwipe.addCompletion {_ in
                    self.slashMark6.removeFromSuperview()
                    self.slashMark6.alpha = 1 // to prepare it for the outside world
            }
            numBtn6WrongSwipe.startAnimation()
        }
        else if(label == numBtn5)
        {
            numBtn5WrongSwipe.stopAnimation(true)
            numBtn5.layer.backgroundColor = red.cgColor
        
            slashMark5.alpha = 1 // in case this method is called again b4 it finishes animation.
            numBtn5.addSubview(slashMark5)
            numBtn5WrongSwipe = UIViewPropertyAnimator(duration: 4, curve: .easeOut, animations: {
                self.numBtn5.layer.backgroundColor = UIColor.clear.cgColor
                self.slashMark5.alpha = 0
            })
            numBtn5WrongSwipe.addCompletion {_ in
                self.slashMark5.removeFromSuperview()
                self.slashMark5.alpha = 1 // to prepare it for the outside world
            }
            numBtn5WrongSwipe.startAnimation()
        }
        else if(label == numBtn4)
        {
            numBtn4WrongSwipe.stopAnimation(true)
            numBtn4.layer.backgroundColor = red.cgColor
            
            slashMark4.alpha = 1 // in case this method is called again b4 it finishes animation.
            numBtn4.addSubview(slashMark4)
            numBtn4WrongSwipe = UIViewPropertyAnimator(duration: 4, curve: .easeOut, animations: {
                self.numBtn4.layer.backgroundColor = UIColor.clear.cgColor
                self.slashMark4.alpha = 0.0
            })
            numBtn4WrongSwipe.addCompletion {_ in
                self.slashMark4.removeFromSuperview()
                self.slashMark4.alpha = 1 // to prepare it for the outside world
            }
            numBtn4WrongSwipe.startAnimation()
        }
        else if(label == numBtn3)
        {
            numBtn3WrongSwipe.stopAnimation(true)
            numBtn3.layer.backgroundColor = red.cgColor
            
            slashMark3.alpha = 1 // in case this method is called again b4 it finishes animation.
            numBtn3.addSubview(slashMark3)
            numBtn3WrongSwipe = UIViewPropertyAnimator(duration: 4, curve: .easeOut, animations: {
                self.numBtn3.layer.backgroundColor = UIColor.clear.cgColor
                self.slashMark3.alpha = 0.0
            })
            numBtn3WrongSwipe.addCompletion {_ in
                self.slashMark3.removeFromSuperview()
                self.slashMark3.alpha = 1 // to prepare it for the outside world
            }
            numBtn3WrongSwipe.startAnimation()
        }
        else if(label == numBtn2)
        {
            numBtn2WrongSwipe.stopAnimation(true)
            numBtn2.layer.backgroundColor = red.cgColor
            
            slashMark2.alpha = 1 // in case this method is called again b4 it finishes animation.
            numBtn2.addSubview(slashMark2)
            numBtn2WrongSwipe = UIViewPropertyAnimator(duration: 4, curve: .easeOut, animations: {
                self.numBtn2.layer.backgroundColor = UIColor.clear.cgColor
                self.slashMark2.alpha = 0.0
            })
            numBtn2WrongSwipe.addCompletion {_ in
                self.slashMark2.removeFromSuperview()
                self.slashMark2.alpha = 1 // to prepare it for the outside world
            }
            numBtn2WrongSwipe.startAnimation()
        }
        else if(label == numBtn1)
        {
            numBtn1WrongSwipe.stopAnimation(true)
            numBtn1.layer.backgroundColor = red.cgColor
            
            slashMark1.alpha = 1 // in case this method is called again b4 it finishes animation.
            numBtn1.addSubview(slashMark1)
            numBtn1WrongSwipe = UIViewPropertyAnimator(duration: 4, curve: .easeOut, animations: {
                self.numBtn1.layer.backgroundColor = UIColor.clear.cgColor
                self.slashMark1.alpha = 0.0
            })
            numBtn1WrongSwipe.addCompletion {_ in
                self.slashMark1.removeFromSuperview()
                self.slashMark1.alpha = 1 // to prepare it for the outside world
            }
            numBtn1WrongSwipe.startAnimation()
        }
    }
    

    
    
    /////////////////////////////////////////////////////////////////////////////////////////////////

    
    func moveCharacter(position : CGFloat)
    {
        if(position == hidingAtBottomLvl)
        {
            topCloak.isHidden = true
            middleCloak.isHidden = true
        }
        else if(position == hidingAtMiddleLvl)
        {
            topCloak.isHidden = true
            middleCloak.isHidden = false
        }
        //        else
        //        {
        //            topCloak.isHidden = false
        //            middleCloak.isHidden = false
        //        }
        
        characterPosition.constant = position
        character.updateConstraints()
    }
    
    func characterPeeks(delay : Double){
        animateCharacterPeek.stopAnimation(true)
        animateHideCharacter.stopAnimation(true)
        animateShowCharacter.stopAnimation(true)
        
        animateCharacterPeek = UIViewPropertyAnimator(duration: 0.2, curve: .easeOut, animations: {
            self.peekPlayer.play(atTime: self.peekPlayer.deviceCurrentTime + delay)
            self.characterPosition.constant -= 80
            self.view.layoutIfNeeded()
        })
        
        animateCharacterPeek.startAnimation(afterDelay: delay)
    }
    
    func hideCharacter(delay :  Double)
    {
        animateCharacterPeek.stopAnimation(true)
        animateHideCharacter.stopAnimation(true)
        animateShowCharacter.stopAnimation(true)
        animateHideCharacter = UIViewPropertyAnimator(duration: 0.2, curve: .easeOut, animations: {
            self.hidePlayer.play(atTime: self.hidePlayer.deviceCurrentTime + 2.2)
            self.characterPosition.constant += 80//166 - 40
            self.view.layoutIfNeeded()
        })
        
        animateHideCharacter.startAnimation(afterDelay: delay)
    }
    
    func showCharacter(delay : Double)
    {
        animateCharacterPeek.stopAnimation(true)
        animateHideCharacter.stopAnimation(true)
        animateShowCharacter.stopAnimation(true)
        animateShowCharacter = UIViewPropertyAnimator(duration: 0.2, curve: .easeOut, animations: {
            self.showPlayer.play(atTime: self.showPlayer.deviceCurrentTime + 0.2)
            self.characterPosition.constant -= 166 - 40
            self.view.layoutIfNeeded()
        })
        animateShowCharacter.startAnimation(afterDelay: delay)
    }
    
    func characterIsHidden() -> Bool
    {
        //        if (characterPosition.constant == hidingAtTopLvl
        //            || characterPosition.constant == hidingAtMiddleLvl
        //            || characterPosition.constant == hidingAtBottomLvl)
        //        {
        //            return true
        //        }
        return false
    }
    
    
    
    /////////////////////////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////////////////////////
    
    @IBAction func changeOperation(_ sender: Any)
    {
        //        if(operation.titleLabel?.text == "-")
        //        {
        //            add()
        //        }
        //        else
        //        {
        //            subtract()
        //        }
    }
    
    func add()
    {
        operation.setTitle("+", for: .normal)
    }
    

    
    @IBAction func nextProblem(_ sender: Any)
    {
        subtractScore += 1
        scoreLabel.text = "Level: \(subtractScore)"
        nextBtn.isEnabled = false
        nextBtn.isHidden = true
        
        if(operation.titleLabel?.text == "-")
        {
            self.subtract()
        }
    }
    
} // end of class









