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
    var controllerHelp: UIViewController!
    
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
    
    //Creating Modal Views entirely from code
    @IBAction func helpBtnPressed(_ sender: UIButton) {
        let label = UILabel(frame: CGRect.zero) //the frame start from origin x,y(0,0).
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Press Expand to maximize the cover"
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 24, weight: .medium)
        label.textColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        
        let closeButton = UIButton(type: .system)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.setTitle("Close", for: .normal)
        closeButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        closeButton.addTarget(self, action: #selector(self.closeHelp), for: .touchUpInside)
        
        controllerHelp = UIViewController()
        controllerHelp.modalPresentationStyle = .pageSheet
        controllerHelp.view.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 0.3)
        controllerHelp.view.addSubview(label)
        controllerHelp.view.addSubview(closeButton)
        
        let cView = controllerHelp.view!
        label.topAnchor.constraint(equalTo: cView.topAnchor, constant: 16).isActive = true
        label.leadingAnchor.constraint(equalTo: cView.leadingAnchor, constant: 16).isActive = true
        label.trailingAnchor.constraint(equalTo: cView.trailingAnchor, constant: -16).isActive = true
        
        closeButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 8).isActive = true
        closeButton.leadingAnchor.constraint(equalTo: cView.leadingAnchor, constant: 16).isActive = true
        closeButton.trailingAnchor.constraint(equalTo: cView.trailingAnchor, constant: -16).isActive = true
        
        present(controllerHelp, animated: true, completion: nil)
    }
    
    @objc func closeHelp() {
        controllerHelp.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "showPicture" {
            let controller = segue.destination as! PictureViewController
            controller.selected = self.selected
        }

    }
    

}
