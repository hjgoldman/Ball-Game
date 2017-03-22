//
//  ViewController.swift
//  Ball Game
//
//  Created by Hayden Goldman on 3/22/17.
//  Copyright © 2017 Hayden Goldman. All rights reserved.
//

import UIKit
import CoreMotion

class BallGameViewController: UIViewController {
    
    private var manager :CMMotionManager!
    var squares = [SquareView]()


    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.manager = CMMotionManager()
        
        let circleView = CircleView(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
        circleView.backgroundColor = UIColor.clear
        circleView.center = self.view.center
        self.view.addSubview(circleView)
        
        let squareView1 = SquareView(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
        let squareView2 = SquareView(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
        let squareView3 = SquareView(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
        let squareView4 = SquareView(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
        let squareView5 = SquareView(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
        let squareView6 = SquareView(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
        let squareView7 = SquareView(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
        let squareView8 = SquareView(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
        let squareView9 = SquareView(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
        let squareView10 = SquareView(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
        let squareView11 = SquareView(frame: CGRect(x: 0, y: 0, width: 25, height: 25))

        self.squares.append(squareView1)
        self.squares.append(squareView2)
        self.squares.append(squareView3)
        self.squares.append(squareView4)
        self.squares.append(squareView5)
        self.squares.append(squareView6)
        self.squares.append(squareView7)
        self.squares.append(squareView8)
        self.squares.append(squareView9)
        self.squares.append(squareView10)
        self.squares.append(squareView11)
        
        for square in self.squares {
            
            let viewHeight = UInt32(self.view.frame.height)
            let viewWidght = UInt32(self.view.frame.width)
            
            let randomPoint: CGPoint = CGPoint(x:Int(arc4random()%viewWidght), y:Int(arc4random()%viewHeight))
            
            square.frame.origin = randomPoint
            self.view.addSubview(square)
        }

        
        if self.manager.isDeviceMotionAvailable {
            self.manager.deviceMotionUpdateInterval = 0.01
            
            self.manager.startDeviceMotionUpdates(to: .main, withHandler: { (data :CMDeviceMotion?, error :Error?) in
                
                if let gravity = data?.gravity {
                    
                    let x = gravity.x * 10.0
                    let y = gravity.y * 10.0
                    
                    circleView.center = CGPoint(x: circleView.center.x + CGFloat(x), y: circleView.center.y + CGFloat(y))
                    
                    if circleView.center.x < 0 {
                        circleView.center.x = 0
                    }
                    if circleView.center.x > self.view.frame.width {
                        circleView.center.x = self.view.frame.width
                    }
                    if circleView.center.y < 0 {
                        circleView.center.y = 0
                    }
                    if circleView.center.y > self.view.frame.height {
                        circleView.center.y = self.view.frame.height
                    }
                    
                    //change color of square to the color of the ball
                    for square in self.squares {
                        
                        if circleView.frame.intersects(square.frame) {
                            square.backgroundColor = UIColor.blue
                        }
                        
                    }
                    
                }
                
            })

        }
    
    }




}

