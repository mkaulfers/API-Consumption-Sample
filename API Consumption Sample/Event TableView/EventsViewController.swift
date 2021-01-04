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
    @IBOutlet weak var tableView: UITableView!
    
    
    ///Other Properties
    let apiHandler = APIHandler()
    var events = [Event]()

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        downloadData()
    }
    
    //Get the data
    func downloadData() {
        URLSession.shared.dataTask(with: apiHandler.apiLink) {  data, response, error in
            if let error = error {
                //Error occurred.
                return
            }
            
            guard let response = response else {
                //Response is empty.
                return
            }
            
            guard let data = data else {
                //Data is empty
                return
            }
            
            //Decode data into model.
            print("Data Downloaded")
        }.resume()
    }
    
    //General setup of the view.
    func setupView() {
        tableView.register(UINib(nibName: "EventCell", bundle: .main), forCellReuseIdentifier: "event_cell_identifier")
    }
}


//MARK: - UITableView Extension
extension EventsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "event_cell_identifier") as? EventCell else {
            ///Unlikely to ever hit this without some critical error.
            return EventCell()
        }
        return cell
    }
}

