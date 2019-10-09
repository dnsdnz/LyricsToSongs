//
//  ViewController.swift
//  SongFinder
//
//  Created by Deniz MacBook Air on 5.10.2019.
//  Copyright © 2019 MacBook Air. All rights reserved.
//

import UIKit
import SwiftSoup

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var searchText: UITextField!
    @IBOutlet weak var tableSong: UITableView!
    @IBOutlet weak var lblWarning: UILabel!
    
    var lyric : String = ""
    var songsArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       tableSong.delegate = self

       tableSong.dataSource = self
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))

        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false

        view.addGestureRecognizer(tap)
        
       
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return songsArray.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:TableViewCellSong = tableSong.dequeueReusableCell(withIdentifier: "song") as! TableViewCellSong
        
        cell.lblSong.text = "\(songsArray[indexPath.row])"
    
        return cell
    }
    

    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }

  
    
    @IBAction func search(_ sender: Any) {
        guard let txtData = searchText.text else {
                // report error and then `return`
                return
            }
            
            lyric = txtData
            
            getData()
         tableSong.reloadData()
            
    }
    
    func getData(){
        
        do {
             tableSong.reloadData()
            let url = NSURL(string: "https://www.lyrics.com/lyrics/" + lyric)
            
            if url == nil {
                lblWarning.text = "Search only by words please!"
            }
            else{
            
            let html = try NSString(contentsOf: url! as URL, encoding: String.Encoding.utf8.rawValue)
            let document: Document = try SwiftSoup.parse(html as String)
            
            
            for element: Element in try! document.select("div p.lyric-meta-title")
            {
                let linkText : String = try! element.text();
                songsArray.append(linkText)
               
                print(linkText)
            }
            }
          
        } catch {
            
        }

    }
}

