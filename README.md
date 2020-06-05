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

## Showing an alternative modal view
        @IBAction func showHelp3(_ sender: UIButton) {
            //To provide access to the UIStoryboard object,
            //the UIViewController class offers the storyboard property.
            if let story = storyboard {
                let helpController3 = story.instantiateViewController(identifier: "helpView") as! SingleViewController
                helpController3.modalPresentationStyle = .formSheet
                
                let presentation = helpController3.presentationController
                presentation?.delegate = self
                
                present(helpController3, animated: true, completion: nil)
            }
        }

        extension DetailViewController: UIAdaptivePresentationControllerDelegate {
            //Showing an alternative modal view
            func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
                return .overFullScreen
            }
            
            func presentationController(_ controller: UIPresentationController, viewControllerForAdaptivePresentationStyle style: UIModalPresentationStyle) -> UIViewController? {
                var controller: iPhoneViewController!
                if style == .overFullScreen {
                    if let story = storyboard {
                        controller = story.instantiateViewController(identifier: "iPhoneView") as? iPhoneViewController
                        return controller
                    }
                }
                return nil
            }
        }

## Segue present as popover on iPad
        if segue.identifier == "showPopover" {
            let controller = segue.destination as! PopoverViewController
            let presentation = controller.presentationController as! UIPopoverPresentationController
            let frame = presentation.sourceView?.bounds
            presentation.sourceRect = frame!
        }

## Segue present as popover on iPhone (a compact horizontal Size Class)
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "showPopover" {
                let controller = segue.destination as! PopoverViewController
                let presentation = controller.presentationController as! UIPopoverPresentationController
                let frame = presentation.sourceView?.bounds
                presentation.sourceRect = frame!
                
                //setting PopoverViewController as the delegate
                //So, have to conform UIAdaptivePresentationControllerDelegate at PopoverViewController.swift
                controller.presentationController?.delegate = controller
            }
        }

        //PopoverViewController conforms to  UIAdaptivePresentationControllerDelegate
        extension PopoverViewController: UIAdaptivePresentationControllerDelegate {
            func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
                return .none
            }
        }


