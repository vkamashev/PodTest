//
//  ViewController.swift
//  PodTest
//
//  Created by vkamashev on 03/21/2019.
//  Copyright (c) 2019 vkamashev. All rights reserved.
//

import UIKit
import PodTest

class ViewController: UIViewController {
    let imageClient = ImageClient()
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func downloadButtonTap(_ sender: UIButton) {
        imageClient.image(with: URL(string: "https://koenig-media.raywenderlich.com/uploads/2016/12/Alamofire-feature.png")!) { [weak self] (result) in
            switch result {
            case let .success(image):
                DispatchQueue.main.async {
                    self?.imageView.image = image
                }
            case let .failure(error):
                print(error)
            }
        }
    }
}

