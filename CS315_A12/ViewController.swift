//
//  ViewController.swift
//  CS315_A12
//
//  Created by Noah Massie on 11/15/22.
//

import UIKit;
import AVFoundation;

class ViewController: UIViewController
{
    @IBOutlet var diceImageView: UIImageView!;
    @IBOutlet var criticalLabel: UILabel!;
    
    override func viewDidLoad()
    {
        super.viewDidLoad();
        // Do any additional setup after loading the view.
        criticalLabel.isHidden = true;
    }
    
    @IBAction func buttonGO()
    {
        rollDice(i:0);
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?)
    {
        if (motion == .motionShake)
        {
            rollDice(i:1);
        }
    }
    
    var audioPlayer: AVAudioPlayer?
    
    func rollDice(i: Int)
    {
        var pathToSound = String("");
//        var url = URL(fileURLWithPath: pathToSound);
        var fileName = String("rolldice");
        var fileType = String("mp3");
        
        switch(i)
        {
        case 0:
            print("Rolled");
            fileName = "rolldice";
//            let pathToSound = Bundle.main.path(forResource: "rolldice", ofType: "mp3")!;
            break;
        case 1:
            print("Shaken");
            fileName = "torpedo"
//            let pathToSound = Bundle.main.path(forResource: "torpedo", ofType: "mp3")!;
            break;
        default:
            break;
        }
        
//        pathToSound = makePath(name: fileName, type: fileType);
        
//        playSound(/*url: url, */path: pathToSound);
        
        let rolledNum = Int.random(in: 1...20);
        let imageName = "d\(rolledNum)";
        
        switch rolledNum
        {
        case 1:
//            let pathToSound = Bundle.main.path(forResource: "failwah", ofType: "mp3")!;
            fileName = "failwah";
            criticalLabel.text = "Oof";
            criticalLabel.isHidden = false;
            break;
        case 20:
//            let pathToSound = Bundle.main.path(forResource: "zfanfare", ofType: "mp3")!;
            fileName = "zfanfare";
            criticalLabel.text = "Nice";
            criticalLabel.isHidden = false;
            break;
        default:
            criticalLabel.isHidden = true;
            break;
        }
        
        pathToSound = makePath(name: fileName, type: fileType);
        
        playSound(/*url: url, */path: pathToSound);
        
        diceImageView.image = UIImage(named: imageName);
    }
    
    func makePath(name: String, type: String) -> String
    {
        var returnPath = Bundle.main.path(forResource: name, ofType: type)!;
        
        return returnPath;
    }
    
    func playSound(/*url: URL, */path: String)
    {
        let url = URL(fileURLWithPath: path);
        
        do
        {
            audioPlayer = try AVAudioPlayer(contentsOf: url);
            audioPlayer?.play();
        }
        catch
        {
            print("error babe");
        }
    }
}
