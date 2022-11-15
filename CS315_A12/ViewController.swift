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
        switch(i)
        {
        case 0:
            print("Rolled");
//            let pathToSound = Bundle.main.path(forResource: "rolldice", ofType: "mp3")!;
            break;
        case 1:
            print("Shaken");
//            let pathToSound = Bundle.main.path(forResource: "torpedo", ofType: "mp3")!;
            break;
        default:
            break;
        }
        
        let rolledNum = Int.random(in: 1...20);
        let imageName = "d\(rolledNum)";
        
        switch rolledNum
        {
        case 1:
//            let pathToSound = Bundle.main.path(forResource: "failwah", ofType: "mp3")!;
            criticalLabel.text = "Oof";
            criticalLabel.isHidden = false;
            break;
        case 20:
//            let pathToSound = Bundle.main.path(forResource: "zfanfare", ofType: "mp3")!;
            criticalLabel.text = "Nice";
            criticalLabel.isHidden = false;
            break;
        default:
            criticalLabel.isHidden = true;
            break;
        }
        
//        let url = URL(fileURLWithPath: pathToSound);
//
//        do
//        {
//            audioPlayer = try AVAudioPlayer(contentsOf: url);
//            audioPlayer?.play();
//        }
//        catch
//        {
//            print("error babe");
//        }
        
        diceImageView.image = UIImage(named: imageName);
    }
}
