//
//  SquareView.swift
//  Ball Game
//
//  Created by Hayden Goldman on 3/22/17.
//  Copyright © 2017 Hayden Goldman. All rights reserved.
//

import UIKit

class SquareView: UIView {
    

    override init(frame: CGRect) {
        super.init(frame : frame)
        
        self.backgroundColor = UIColor.red
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
