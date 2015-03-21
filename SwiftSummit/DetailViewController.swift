//
//  DetailViewController.swift
//  SwiftSummit
//
//  Created by Jan Riehn on 17/03/2015.
//  Copyright (c) 2015 ThoughtWorks. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!


    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail: AnyObject = self.detailItem {
            if let label = self.detailDescriptionLabel {
                label.text = detail.valueForKey("timeStamp")!.description
            }
        }
    }
    
    func fadeOut(onCompletion: (Void) -> Void) {
        UIView.animateWithDuration(1.0, animations: { () -> Void in
            self.view.alpha = 0
            onCompletion()
        })
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

