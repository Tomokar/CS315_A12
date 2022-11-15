//
//  ViewController.swift
//  CS315_A12
//
//  Created by Noah Massie on 11/15/22.
//

import UIKit;

class ViewController: UIViewController
{
    @IBOutlet var diceImageView: UIImageView!;
    @IBOutlet var criticalLabel: UILabel!;
    
    override func viewDidLoad()
    {
        super.viewDidLoad();
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonGO()
    {
        rollDice();
    }
    
    func rollDice()
    {
        print("Rolled");
        
        let rolledNum = Int.random(in: 1...20);
        let imageName = "d\(rolledNum)";
        
        diceImageView.image = UIImage(named: imageName);
        
    }
}
