//
//  ViewController.swift
//  TableViewCellSize
//
//  Created by Amita Pai on 3/30/16.
//  Copyright © 2016 Amita Pai. All rights reserved.
//

import UIKit

extension UIView {
    func getSuperviewOfType<T>(type: T.Type) -> T? {
        var parentView: UIView? = self
        while parentView != nil {
            parentView = parentView!.superview
            if let view = parentView as? T {
                return view
            }
        }
        return nil
    }
    
    func getSubviewOfType<T>(type: T.Type) -> T? {
        var view: T? = nil
        self.subviews.forEach { (subview) in
            if let sv = subview as? T {
                view = sv
                return
            } else {
                view = subview.getSubviewOfType(type)
                if view != nil {
                    return
                }
            }
        }
        return view
    }
}

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let someLines = [
    "Cell is sent a resolved width when it is created/dequeued using one of the two methods: systemLayoutSizeFittingSize(targetSize: CGSize) -> CGSize when using Auto Layout sizeThatFits(size: CGSize) -> CGSize without Auto Layout. \nCell returns a resolved height. Auto Layout will happily return this resolved height for you.   <-- that's the magic",
        "If we don’t send the message setTranslatesAutoresizingMaskIntoConstraints(false) to view2 Auto Layout will create constraints for us. When we add our own they will always be too many. As I mentioned above always make setTranslatesAutoresizingMaskIntoConstraints() false when you are working programmatically with constraints. Uncomment the line again ad the app works perfectly.",
        "Constraints must be on the cell’s contentView.",
        "The new default rowHeight property for UITableView is UITableViewAutomaticDimension. If you were setting it before, make sure you return it to this new default, and remove any calculations you based from it since it’s no longer a logical number.",
        "Like iOS 7, you can still provide the estimatedHeightForRowAtIndexPath method or estimatedRowHeight property to help the table view make a more accurate guess for contentSize on load.",
        "If your cell’s instrinsicContentSize changes for any reason, you must reload the table for it to update the size accordingly. You can animate this change with methods such as reloadRowsAtIndexPaths(_ indexPaths: [AnyObject], withRowAnimation animation: UITableViewRowAnimation)"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 44.0 // some positive value
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.someLines.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCellWithIdentifier("cellWithLabel", forIndexPath: indexPath) as UITableViewCell
//        if let label = cell.textLabel {
//            label.text = self.someLines[indexPath.row]
//            label.numberOfLines = 0
//            print("\(indexPath.row) - \(self.someLines[indexPath.row])")
//        }

        let cell = tableView.dequeueReusableCellWithIdentifier("customCellWithLabel", forIndexPath: indexPath) as! CustomTableViewCell
//        cell.label.hidden = true
        cell.textView.text = self.someLines[indexPath.row]
        
//        cell.textView.hidden = true
//        cell.label.text = self.someLines[indexPath.row]
//        cell.label.numberOfLines = 0
        
        return cell
    }
}

