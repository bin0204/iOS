//
//  ViewController.swift
//  imageView
//
//  Created by Seobin Nam on 10/14/17.
//  Copyright © 2017 Seobin Nam. All rights reserved.
//

import UIKit

var numImage = 0

class ViewController: UIViewController {
    
    
    @IBOutlet weak var imgView: UIImageView!
    
    var imageName = ["01.png","02.png","03.png","04.png","05.png","06.png"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //Set default view to first image of imagenName array [0]
        imgView.image = UIImage(named: imageName[0])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func beforeBtnImage(_ sender: UIButton) {
        numImage = numImage - 1
        if (numImage<0) {
            numImage = imageName.count-1
        }
        imgView.image = UIImage(named:imageName[numImage])
    }
    
    @IBAction func nextBtnImage(_ sender: UIButton) {
        numImage = numImage + 1;
        if (numImage>=imageName.count) {
            numImage = 0
        }
        imgView.image = UIImage(named:imageName[numImage])
    }
}

