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
    @IBOutlet weak var searchBar: UISearchBar!
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
            
            do {
                let eventApiData = try JSONDecoder().decode(EventAPIData.self, from: data)
                self.events = eventApiData.events
                
            } catch (let error) {
                print(error.localizedDescription)
            }
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }.resume()
    }
    
    //General setup of the view.
    func setupView() {
        tableView.register(UINib(nibName: "EventCell", bundle: .main), forCellReuseIdentifier: "event_cell_identifier")
        if #available(iOS 13.0, *) {
            searchBar.searchTextField.leftView?.tintColor = .white
        } else {
            searchBar.tintColor = .white
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as? EventDetailViewController
        
        if let sender = sender as? Event,
           let destination = destination {
            destination.event = sender
        }
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
        cell.event = events[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "to_details_storyboard", sender: events[indexPath.row])
    }
}

