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
    
    @IBAction func goback_click(_ sender: Any) {
            performSegue(withIdentifier: "segueBack", sender: self)
    }
    
    func showDetails(){
    }
}


extension ContentViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return marvelViewModelObj.MarvelData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "contentcell") as! ContentTableViewCell
        cell.setupContent(title: marvelViewModelObj.MarvelData[indexPath.row].name)
        return cell
    }

    
    

}
