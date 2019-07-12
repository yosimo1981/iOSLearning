//
//  ViewController.swift
//  FaceTracker
//
//  Created by Yuuki Yoshimoto on 2019/07/11.
//  Copyright © 2019 Yuuki Yoshimoto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    var faceTracker:FaceTracker? = nil;
    
    @IBOutlet var cameraView: UIView!//viewController上に一つviewを敷いてそれと繋いでおく
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let rectLayer = CALayer()
        rectLayer.borderWidth = 3//四角い枠を用意しておく
        
        self.cameraView.layer.addSublayer(rectLayer)
        faceTracker = FaceTracker(view: self.cameraView, layer: rectLayer, findface:{arr in
            let rect = arr[0];//一番の顔だけ使う
            rectLayer.frame = rect;//四角い枠を顔の位置に移動する
        })
    }
}
