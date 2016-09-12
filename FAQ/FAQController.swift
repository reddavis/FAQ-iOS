//
//  FAQController.swift
//  FAQ
//
//  Created by Red Davis on 28/07/2016.
//  Copyright © 2016 GVL. All rights reserved.
//

import Foundation


internal protocol FAQSectionViewControllerDelegate
{
    func sectionViewController(controller: UIViewController, didSelectSection section: FAQSection)
}


public final class FAQController: UIViewController
{
    // Private
    private let URL: NSURL!
    private var rootSection: FAQSection?
    private var rootNavigationController: UINavigationController?
    
    private let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .Gray)
        activityIndicator.hidesWhenStopped = true
        
        return activityIndicator
    }()
    
    // MARK: Initialization
    
    public required init(URL: NSURL)
    {
        self.URL = URL
        super.init(nibName: nil, bundle: nil)
    }
    
    public required init?(coder aDecoder: NSCoder)
    {
        self.URL = nil
        super.init(coder: aDecoder)
    }
    
    // MARK: View lifecycle
    
    public override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        // Activity indicator
        self.activityIndicator.startAnimating()
        self.view.addSubview(self.activityIndicator)
        
        // Load JSON
        NSURLSession.sharedSession().dataTaskWithURL(self.URL) { (data, response, error) in
            guard let unwrappedData = data else
            {
                return
            }
            
            do
            {
                let JSON = try NSJSONSerialization.JSONObjectWithData(unwrappedData, options: [])
                if let sectionData = JSON as? [String : AnyObject]
                {
       
                    dispatch_async(dispatch_get_main_queue(), {
                        do
                        {
                            let rootSection = try FAQSection(data: sectionData)
                            
                            let rootNavigationController = UINavigationController(rootViewController: rootSection.viewController)
                            
                            rootNavigationController.view.frame = self.view.bounds
                            self.addChildViewController(rootNavigationController)
                            self.view.addSubview(rootNavigationController.view)
                            
                            self.rootSection = rootSection
                            self.rootNavigationController = rootNavigationController
                            self.activityIndicator.stopAnimating()
                        }
                        catch
                        {
                            // TODO: Handle error
                        }
                    })
                }
            }
            catch
            {
                
            }
        }.resume()
    }
    
    public override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
    }
    
    public override func viewDidLayoutSubviews()
    {
        super.viewDidLayoutSubviews()
        
        self.activityIndicator.center = self.view.center
        self.rootNavigationController?.view.frame = self.view.bounds
    }
}
