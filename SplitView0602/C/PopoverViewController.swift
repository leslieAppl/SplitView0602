//
//  PopoverViewController.swift
//  SplitView0602
//
//  Created by leslie on 6/4/20.
//  Copyright © 2020 leslie. All rights reserved.
//

import UIKit

class PopoverViewController: UIViewController {
    
    var selected: Int!
    
    @IBOutlet weak var messageLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var author = ""
        
        if selected != nil {
            let file = AppData.items2[selected]
            if let data = AppData.itemsData[file] {
                author = data[1]
            }
            
            let search = AppData.itemsData.filter { (item) -> Bool in
                
                //0: keys; 1: values;
                let data = item.1
                if data[1] == author {
                    return true
                }
                return false
            }
            
            let total = search.count
            
            if total > 1 {
                messageLbl.text = "We have \(total) books from this author."
            }
            else {
                messageLbl.text = "We have \(total) book from this author."
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
