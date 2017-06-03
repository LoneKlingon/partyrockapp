//
//  ViewController.swift
//  PartyRockApp
//
//  Created by Anthony Youbi Sobodker on 2017-05-29.
//  Copyright © 2017 SBS. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var partyRockData = [PartyRock]()
    
    @IBOutlet weak var tableView: UITableView!
    
    let urlTest = "<iframe name=\"tubevideo1\" width=\"90%\" height=\"90%\" src=\"https://www.dailymotion.com/embed/video/x3m6oq\" frameborder=\"0\" allowfullscreen></iframe>"
    
    let imgTest = "https://images.genius.com/42f0ea2dd368dd7948b21bceae164b19.500x500x1.jpg"
    
    let videoTest = "Have you ever loved somebody"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //set delegate and datasource to current VC
        tableView.delegate = self
        tableView.dataSource = self
        
        let p1 = PartyRock(imageURL: imgTest, videoURL: urlTest, videoTitle: videoTest)
        
        
        partyRockData.append(p1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //method for modifying individual cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PartyCellTableViewCell", for: indexPath) as? PartyCellTableViewCell
        {
            let partyRockEntry = partyRockData[indexPath.row]
            cell.UpdateUI(partyRock: partyRockEntry)
            
            return cell
        }
        
        else
        {
            return UITableViewCell()
        }
        
        
    }
    
    //method that sets number of rows in tableview
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return partyRockData.count
    }
    
    //method for when tableview cell is selected 
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let partyRockMainVCData = partyRockData[indexPath.row]
        
        performSegue(withIdentifier: "VideoViewController", sender: partyRockMainVCData)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? VideoViewController
        {
            if let video = sender as? PartyRock
            {
                destination.partyRock = video
            }
        }
        
    }


}

