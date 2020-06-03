# Split View

## Adding display mode button

## Showing the Master view instead of the Detail view when the app is launched

## Present Modally Segue and dismiss the view controller presented

## Three ways to Create Modal Views dynamically from code:

- 1. Creating Modal Views entirely from code

- 2. Creating Modal Views from XIB File
            
            @IBAction func showHelp2(_ sender: UIButton) {
                let helpController = HelpController()
                helpController.modalPresentationStyle = .pageSheet
                present(helpController, animated: true, completion: nil)
            }
        
- 3. Creating Modal Views from Single View Controller initiated with UIStoryboard ID
            
            @IBAction func showHelp3(_ sender: UIButton) {
                //To provide access to the UIStoryboard object,
                //the UIViewController class offers the storyboard property.
                if let story = storyboard {
                    let helpController = story.instantiateViewController(identifier: "helpView") as! SingleViewController
                    helpController.modalPresentationStyle = .formSheet
                    present(helpController, animated: true, completion: nil)
                }
            }


