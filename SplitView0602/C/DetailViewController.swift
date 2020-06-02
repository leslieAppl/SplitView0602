//
//  DetailViewController.swift
//  SplitView0602
//
//  Created by leslie on 6/2/20.
//  Copyright © 2020 leslie. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var selected: Int!

    @IBOutlet weak var bookCover: UIImageView!
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var bookAuthor: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Adding a Display Mode Button to the Navigation Bar of the second Detail view
        let button = splitViewController?.displayModeButtonItem
        navigationItem.leftBarButtonItem = button
        navigationItem.leftItemsSupplementBackButton = true
        
        if self.selected != nil {
            let file = AppData.items2[selected]
            bookCover.image = UIImage(named: file)
            if let data = AppData.itemsData[file] {
                bookTitle.text = data[0]
                bookAuthor.text = data[1]
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
