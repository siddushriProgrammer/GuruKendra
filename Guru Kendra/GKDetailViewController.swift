//
//  DetailViewController.swift
//  Guru Kendra.
//
//  Created by Siddalingamurthy Gangadharappa on 10/17/15.
//  Copyright © 2015 Adroit. All rights reserved.
//

import UIKit


class GKDetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!
    
    @IBOutlet var borderedButtons: [UIButton]!
    
    weak var delegate:GKMasterDetailDelegate?

    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail = self.detailItem {
            if let label = self.detailDescriptionLabel {
                label.text = detail.description
            }
        }
        
        for brButton:UIButton in borderedButtons {
            
            brButton.layer.borderWidth = 1.0
            brButton.layer.borderColor =  UIColor.whiteColor().CGColor
            brButton.layer.cornerRadius = 8.0
        }
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

