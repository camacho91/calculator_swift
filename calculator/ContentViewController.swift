//
//  ContentViewController.swift
//  calculator
//
//  Created by Backlayer on 7/6/19.
//  Copyright © 2019 calculator test. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {

    @IBOutlet weak var tblContent: UITableView!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        tblContent.delegate = self
        tblContent.dataSource = self
       
        
    }
    


}


extension ContentViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comicList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let comic = comicList[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "contentcell") as! ContentTableViewCell
        
        cell.setupContent(comic: comic)
        
        return cell
    }
}
