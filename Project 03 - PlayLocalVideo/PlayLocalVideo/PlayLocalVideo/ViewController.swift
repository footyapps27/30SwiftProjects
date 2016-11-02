//
//  ViewController.swift
//  PlayLocalVideo
//
//  Created by Samrat on 2/11/16.
//  Copyright © 2016 SMRT. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    //MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "Watch Later"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Actions
    @IBAction func playTapped(_ sender: UIButton) {
        //TODO: Start the video here
        do {
            try playVideo()
        }catch AppError.InvalidResource( _, _) {
            debugPrint("Invalid resouce")
        }catch {
            debugPrint("Something went wrong")
        }
    }
    
    //MARK: Helpers
    func playVideo() throws {
        guard let path = Bundle.main.path(forResource: "emoji zone", ofType:"mp4") else {
            throw AppError.InvalidResource("video", "m4v")
        }
        let player = AVPlayer(url: NSURL(fileURLWithPath: path) as URL)
        let playerController = AVPlayerViewController()
        playerController.player = player
        self.present(playerController, animated: true) {
            player.play()
        }
    }
}

//MARK: TableView Delegates
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "videoCell", for: indexPath)
        //cell.textLabel!.text = "it works"
        return cell
    }
}

enum AppError : Error {
    case InvalidResource(String, String)
}
