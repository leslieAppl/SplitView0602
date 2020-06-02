//
//  EmptyViewController.swift
//  SplitView0602
//
//  Created by leslie on 6/2/20.
//  Copyright © 2020 leslie. All rights reserved.
//

import UIKit

class EmptyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //Adding a Display Mode Button to the Navigation Bar of the second Detail view
        let button = splitViewController?.displayModeButtonItem
        navigationItem.leftBarButtonItem = button
        navigationItem.leftItemsSupplementBackButton = true
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
