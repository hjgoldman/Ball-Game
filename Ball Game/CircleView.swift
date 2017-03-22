//
//  CircleView.swift
//  Ball Game
//
//  Created by Hayden Goldman on 3/22/17.
//  Copyright © 2017 Hayden Goldman. All rights reserved.
//

import UIKit

class CircleView: UIView {

    override func draw(_ rect: CGRect) {
        
        UIColor.blue.setFill()
        let circle = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 25, height: 25))
        circle.fill()
    }

}
