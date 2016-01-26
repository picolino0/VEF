//
//  MarkersViewController.swift
//  VEF
//
//  Created by Colin Rosen on 12/14/15.
//  Copyright © 2015 Colin Rosen. All rights reserved.
//

import UIKit

class MarkersViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIAlertViewDelegate {

    var markers = List<Marker>()
    var timePassed = 0
    
    private var markerEditing : Marker? = nil
    
    @IBOutlet weak var btnQuestion: UIButton!
    @IBOutlet weak var btnRemark: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSTimer.scheduledTimerWithTimeInterval (1, target: self, selector: "timer", userInfo: nil, repeats: true)
    }
    
    override func viewWillAppear (animated: Bool) {
        self.navigationController?.navigationBarHidden = false
    }
    
    func tableView (tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.markers.count
    }
    
    func tableView (tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let marker = markers.get(indexPath.row)!
        
        let cell = UITableViewCell()
        cell.textLabel?.text = marker.toString()
        
        if marker.getType() == MarkerType.QUESTION {
            cell.imageView!.image = UIImage(named: "question")
        }
        
        if marker.getType() == MarkerType.REMARK {
            cell.imageView!.image = UIImage(named: "remark")
        }
        
        return cell
    }
    
    func timer() {
        timePassed++
    }
    
    @IBAction func btnClick (sender : UIButton) {
        if sender == btnQuestion {
            markers.add(Marker(user: 1, content: "Question", time: timePassed, type: MarkerType.QUESTION))
        }
        
        if sender == btnRemark {
            markers.add(Marker(user: 1, content: "Remark", time: timePassed, type: MarkerType.REMARK))
        }
        
        self.tableView.reloadData()
        self.tableView.scrollToRowAtIndexPath(NSIndexPath(forRow: markers.count-1, inSection: 0), atScrollPosition: UITableViewScrollPosition.Bottom, animated: true)
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let alert = UIAlertView(title: "Marker description", message: "Enter a description", delegate: self, cancelButtonTitle: "Cancel", otherButtonTitles: "Ok")
        alert.cancelButtonIndex = 1
        alert.alertViewStyle = UIAlertViewStyle.PlainTextInput
        alert.textFieldAtIndex(0)?.autocapitalizationType = .Sentences
        
        self.markerEditing = markers[indexPath.row]
        
        alert.show()
    }
    
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        if buttonIndex == 1 {
            // Ok button
            let text = alertView.textFieldAtIndex(0)!.text
            if text != nil {
                self.markerEditing?.setContent(text!)
                self.tableView.reloadData()
            }
        }
        
        self.markerEditing = nil
    }
}
