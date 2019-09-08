//
//  ViewController.swift
//  ImageViewer
//
//  Created by Levi Kaplan on 8/16/19.
//  Copyright © 2019 Levi Kaplan. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var pictures = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // gives the main menu a large title
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // adds a title
        title = "Image Viewer"
        
        // adds top bar button item recommending the app to others
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(recommendTapped))
        
        // lets us work with the file system
        let fm = FileManager.default
        
        // tells where to find all the images added to the app
        let path = Bundle.main.resourcePath!
        
        // constant items is set to the contents of the directory at the path set in the previous line
        // items constant will be array of strings containing file names
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        // loops through every item in our items array
        for item in items {
            if item.hasPrefix("nssl") {
                // this is a picture to load
                pictures.append(item)
            }
        }
        
        // sorts the images by number
        pictures.sort()
    }

    // calculates the number of rows needed in the tableview
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    // determines what cell should occupy each row
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 1: try loading the "Detail" view controller and typecasting it to be DetailViewController
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            // 2: success! Set its selectedImage property
            vc.selectedImage = pictures[indexPath.row]
            vc.selectedPictureNumber = indexPath.row + 1
            vc.totalPictures = pictures.count
            
            // 3: now push it onto the navigation controller
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
   
    @objc func recommendTapped() {
        let shareURL: [Any] = ["Check out this app!", URL(string: "https://www.apple.com")!]
        
        let ac = UIActivityViewController(activityItems: shareURL, applicationActivities: [])
        present(ac, animated: true)
    }
    
}

