//
//  ViewController.swift
//  SectionIndexDemo
//
//  Created by Prasanthi Relangi on 4/27/16.
//  Copyright © 2016 prasanthi. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var animalsDict = ["B":["Bear", "Black Swan", "Buffalo"],
                       "C":["Camel", "Cockatoo"],
                       "D":["Dog", "Donkey"],
                       "E":["Emu"],
                       "G":["Giraffe", "Greater Rhea"],
                       "H":["Hippopotamus", "Horse"],
                       "K":["Koala"],
                       "L":["Lion", "Llama"],
                       "M":["Manatus", "Meerkat"],
                       "P":["Panda", "Peacock", "Pig", "Platypus", "Polar Bear"],
                       "R":["Rhinoceros"],
                       "S":["Seagull"],
                       "T":["Tasmania Devil"],
                       "W":["Whale", "Whale Shark", "Wombat"]
                       ]
    
    var animalSectionTitles:[String]?
    var animalIndex = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".characters.map({String($0)})
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        let lazyMapCollection = animalsDict.keys
        animalSectionTitles = Array(lazyMapCollection).sort() {$0<$1}
        
        print(animalIndex)
        
        tableView.reloadData()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //// Two methods needed for displaying section Index for the tableView
    func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
        return animalIndex
    }
    
    func tableView(tableView: UITableView, sectionForSectionIndexTitle title: String, atIndex index: Int) -> Int {
        let section = (animalSectionTitles!.indexOf(title)) ?? 0
        return section
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let animalKey: String = animalSectionTitles![section]
        let animalsInSection:[String] = animalsDict[animalKey]!
        return animalsInSection.count
    }

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("animalCell", forIndexPath: indexPath)
        let animalKey = animalSectionTitles![indexPath.section]
        let animalArray = animalsDict[animalKey]
        let animalName = animalArray![indexPath.row]
        let animalImageName = animalName.lowercaseString.stringByReplacingOccurrencesOfString(" ", withString: "_")
        let animalImageNameFinal = "\(animalImageName).jpg"
        cell.textLabel!.text = animalName
        cell.imageView!.image = UIImage(named: animalImageNameFinal)
        
        return cell
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return animalSectionTitles![section]
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return (animalSectionTitles?.count)!
    }// Default is 1 if not implemented



}

