//
//  ViewController.swift
//  BlurImageDemo
//
//  Created by ios on 14/06/2017.
//  Copyright © 2017 mellow. All rights reserved.
//

import UIKit

public let ScreenWidth = UIScreen.main.bounds.size.width
public let ScreenHeight = UIScreen.main.bounds.size.height

extension UIImage {
    public func scale(toHeight maxHeight: CGFloat) -> UIImage {
        let scale = self.size.width/self.size.height
        let maxWidth = maxHeight * scale
        return self.scale(with: maxWidth, height: maxHeight)
    }
    
    public func scale(with width: CGFloat, height: CGFloat) -> UIImage {
        
        UIGraphicsBeginImageContextWithOptions(CGSize.init(width: width, height: height),false, UIScreen.main.scale);
        self.draw(in: CGRect.init(x: 0, y: 0, width: width, height: height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
}

class ViewController: UIViewController {

    lazy var tintSlider: UISlider = {
        let slider = UISlider.init(frame: CGRect.init(x: 0, y: 620, width: ScreenWidth, height: 30))
        slider.addTarget(self, action: #selector(setBlurBackground), for: .valueChanged)
        slider.minimumValue = 0
        slider.maximumValue = 1
        return slider
    }()
    
    lazy var saturationSlider: UISlider = {
        let slider = UISlider.init(frame: CGRect.init(x: 0, y: 650, width: ScreenWidth, height: 30))
        slider.addTarget(self, action: #selector(setBlurBackground), for: .valueChanged)
        slider.minimumValue = -5
        slider.maximumValue = 5
        return slider
    }()
    
    lazy var blurSlider: UISlider = {
        let slider = UISlider.init(frame: CGRect.init(x: 0, y: 680, width: ScreenWidth, height: 30))
        slider.addTarget(self, action: #selector(setBlurBackground), for: .valueChanged)
        slider.minimumValue = 0
        slider.maximumValue = 30
        return slider
    }()
    
    lazy var imageView: UIImageView = {
        let img = #imageLiteral(resourceName: "sample_image")
        let w = ScreenWidth*0.7
        let h = w/(img.size.width/img.size.height)
        let view = UIImageView.init(frame: CGRect.init(x: (ScreenWidth-w)/2, y: (ScreenHeight-h)/2, width: w, height: h))
        view.image = img
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        saturationSlider.value = 2.8
        blurSlider.value = 30
        
        view.addSubview(imageView)
        view.addSubview(tintSlider)
        view.addSubview(saturationSlider)
        view.addSubview(blurSlider)
        setBlurBackground()
    }
    
    func setBlurBackground() {
        let image = #imageLiteral(resourceName: "sample_image")
        print("tint:\(tintSlider.value) saturation:\(saturationSlider.value) blur:\(blurSlider.value)")
        
        let scaleImg = image.scale(toHeight: self.view.frame.height)
        scaleImg.blurImage(with: .black, colorOpacity: CGFloat(tintSlider.value), saturationDeltaFactor: CGFloat(saturationSlider.value), blurRadius: CGFloat(blurSlider.value), completion: { (blurImage) in
            if let image = blurImage {
                self.view.backgroundColor = UIColor.init(patternImage: image)
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

