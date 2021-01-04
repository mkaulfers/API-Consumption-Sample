//
//  ViewController.swift
//  API Consumption Sample
//
//  Created by Matthew Kaulfers on 1/4/21.
//

import UIKit

class EventsViewController: UIViewController {
    //MARK: - Class Properties
    ///@IBOutlets
    
    
    ///Other Properties

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


//MARK: - UITableView Extension
extension EventsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
}

