//
//  DropDown.swift
//  PokeAPI
//
//  Created by Lorenzo Hernandez III on 4/8/18.
//  Copyright © 2018 Lorenzo Hernandez III. All rights reserved.
//

import Foundation
import UIKit
import DropDown

@objc enum FactoryViewType: Int{
    case Button, View, TextView, ImageView
}

@objc class DropDownReturn:NSObject{
    
    let dropDown = DropDown()
    
    @objc
    func dropDownCall(sender: UIButton!){
        self.dropDown.show()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
            self.dropDown.hide()
        }
    }
    
    func createDropDown(x: CGFloat, y: CGFloat, w: CGFloat, h: CGFloat, view: UIView)->UIButton{
        //create button
        let buttonWDrop = UIButton(frame: CGRect(x: x, y: y, width: w, height: h))
        buttonWDrop.setImage(#imageLiteral(resourceName: "Menu"), for: .normal)
        buttonWDrop.layer.borderColor = UIColor.black.cgColor
        buttonWDrop.layer.borderWidth = 1
        buttonWDrop.layer.cornerRadius = 5.0
        
        dropDown.dataSource = ["Pixels", "Cartoon"]
        dropDown.selectionAction = { (index: Int, item: String) in
            view.reloadInputViews()
        }
        dropDown.dismissMode = .automatic
        
        //attach dropdown to button
        dropDown.anchorView = buttonWDrop
        
        return buttonWDrop
    }
}
