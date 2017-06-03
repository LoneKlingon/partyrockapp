//
//  VideoViewController.swift
//  PartyRockApp
//
//  Created by Anthony Youbi Sobodker on 2017-05-29.
//  Copyright © 2017 SBS. All rights reserved.
//

import UIKit

class VideoViewController: UIViewController {
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var videoTitleLbl: UILabel!
    
    
    //container for sent data from mainviewcontroller 
    private var _partyRock:PartyRock!
    
    
    var partyRock: PartyRock
    {
        //set partyRock to sent data
        set
        {
            _partyRock = newValue
        }
        
        //return the sent data
        get
        {
            return _partyRock
        }
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        videoTitleLbl.text = partyRock.videoTitle
        webView.loadHTMLString(partyRock.videoURL, baseURL: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
