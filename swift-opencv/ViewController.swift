//
//  ViewController.swift
//  swift-opencv
//
//  Created by Paulius Serafinavicius on 2016-05-05.
//  Copyright © 2016 Paulius Serafinavicius. All rights reserved.
//

import UIKit

class ViewController: UIViewController, OpenCvWrapperDelegate {
    
    var ocv:OpenCvWrapper!
    @IBOutlet weak var imageView:UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ocv = OpenCvWrapper()
        ocv.delegate = self;
        ocv.open(withCameraView: UIView())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let orientation = UIApplication.shared.statusBarOrientation as UIInterfaceOrientation
        ocv.setInterfaceOrientation(orientation)
    }

    func cameraImageRetrieved(_ image:UIImage) {
        DispatchQueue.main.async {
            self.imageView.image = image
        }
    }

}

