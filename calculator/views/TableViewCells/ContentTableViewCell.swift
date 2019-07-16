//
//  ContentTableViewCell.swift
//  calculator
//
//  Created by Backlayer on 7/6/19.
//  Copyright © 2019 calculator test. All rights reserved.
//

import UIKit

class ContentTableViewCell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
  
    
    func setupContent(title: String?){
        lblName.text = title
    }
    
}




