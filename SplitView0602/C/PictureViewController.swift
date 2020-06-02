//
//  PictureViewController.swift
//  SplitView0602
//
//  Created by leslie on 6/2/20.
//  Copyright © 2020 leslie. All rights reserved.
//

import UIKit

class PictureViewController: UIViewController {

    var selected: Int!
    
    @IBOutlet weak var picture: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if selected != nil {
            let file = AppData.items2[selected]
            picture.image = UIImage(named: file)
        }
    }
    
    @IBAction func closeBtnPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
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
