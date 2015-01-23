//
//  KeyboardViewController.swift
//  CustomKeyBoard
//
//  Created by Anil on 17/01/15.
//  Copyright (c) 2015 Variya Soft Solutions. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var nextKeyboardButton: UIButton!
    var datePicker = UIDatePicker()
    var hideKeyboardButton: UIButton!
    var deleteButton: UIButton!
    var selecetdDate = String()
    @IBOutlet weak var tableView: UITableView!
    override func updateViewConstraints() {
        super.updateViewConstraints()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.DatePicker()
        self.addHideKeyboardButton()
        self.addDelete()
        
     
        
        // Perform custom UI setup here
        self.nextKeyboardButton = UIButton.buttonWithType(.System) as UIButton
    
        self.nextKeyboardButton.setTitle(NSLocalizedString("Next Keyboard", comment: "Title for 'Next Keyboard' button"), forState: .Normal)
        self.nextKeyboardButton.sizeToFit()
        self.nextKeyboardButton.setTranslatesAutoresizingMaskIntoConstraints(false)
    
        self.nextKeyboardButton.addTarget(self, action: "advanceToNextInputMode", forControlEvents: .TouchUpInside)
        
        self.view.addSubview(self.nextKeyboardButton)
    
        var nextKeyboardButtonLeftSideConstraint = NSLayoutConstraint(item: self.nextKeyboardButton, attribute: .Left, relatedBy: .Equal, toItem: self.view, attribute: .Left, multiplier: 1.0, constant: 0.0)
        var nextKeyboardButtonBottomConstraint = NSLayoutConstraint(item: self.nextKeyboardButton, attribute: .Bottom, relatedBy: .Equal, toItem: self.view, attribute: .Bottom, multiplier: 1.0, constant: 0.0)
        self.view.addConstraints([nextKeyboardButtonLeftSideConstraint, nextKeyboardButtonBottomConstraint])
    }
    
    func DatePicker(){
    
        datePicker.datePickerMode = UIDatePickerMode.Date
        datePicker.backgroundColor = UIColor.whiteColor()
        self.datePicker.addTarget(self, action: Selector("datePickerChanged"), forControlEvents: UIControlEvents.ValueChanged)
        self.view.addSubview(datePicker)
    }
    
    func datePickerChanged(){
        
        var dateFormamtter = NSDateFormatter()
        dateFormamtter.dateStyle = NSDateFormatterStyle.ShortStyle
        var strDate = dateFormamtter.stringFromDate(datePicker.date)
        self.selecetdDate = strDate
//        var proxy = textDocumentProxy as UITextDocumentProxy
//        proxy.insertText(strDate)
    }
    
    func addHideKeyboardButton() {
        
        hideKeyboardButton = UIButton.buttonWithType(.System) as UIButton
        hideKeyboardButton.setTitle("Select Date", forState: .Normal)
        hideKeyboardButton.sizeToFit()
        hideKeyboardButton.setTranslatesAutoresizingMaskIntoConstraints(false)
        hideKeyboardButton.addTarget(self, action: "goToNext", forControlEvents: .TouchUpInside)
        
        view.addSubview(hideKeyboardButton)
        
        var rightSideConstraint = NSLayoutConstraint(item: hideKeyboardButton, attribute: .Right, relatedBy: .Equal, toItem: view, attribute: .Right, multiplier: 1.0, constant: -10.0)
        var bottomConstraint = NSLayoutConstraint(item: hideKeyboardButton, attribute: .Bottom, relatedBy: .Equal, toItem: view, attribute: .Bottom, multiplier: 1.0, constant: 0.0)
        view.addConstraints([rightSideConstraint, bottomConstraint])
    }
    
    func addDelete() {
        
        deleteButton = UIButton.buttonWithType(.System) as UIButton
        deleteButton.setTitle(" Delete ", forState: .Normal)
        deleteButton.sizeToFit()
        deleteButton.setTranslatesAutoresizingMaskIntoConstraints(false)
        deleteButton.addTarget(self, action: "didTapDelete", forControlEvents: .TouchUpInside)
        deleteButton.layer.cornerRadius = 5
        
        view.addSubview(deleteButton)
        
        var rightSideConstraint = NSLayoutConstraint(item: deleteButton, attribute: .Right, relatedBy: .Equal, toItem: view, attribute: .Right, multiplier: 1.0, constant: -10.0)
        var topConstraint = NSLayoutConstraint(item: deleteButton, attribute: .Top, relatedBy: .Equal, toItem: view, attribute: .Top, multiplier: 1.0, constant: +10.0)
        view.addConstraints([rightSideConstraint, topConstraint])
    }
    
    func goToNext(){
        
        var proxy = textDocumentProxy as UITextDocumentProxy
        proxy.insertText(selecetdDate)
        let nib = UINib(nibName: "KeyboardView", bundle: nil)
        let objects = nib.instantiateWithOwner(self, options: nil)
        view = objects[0] as UIView;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
       return 24
    }
    
   
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")
        cell.textLabel.text = "\(indexPath.row)"
        cell.textLabel.font = UIFont.systemFontOfSize(10)
        return cell
    }
    
    func didTapDelete() {
        var proxy = textDocumentProxy as UITextDocumentProxy
        proxy.deleteBackward()
    }

    override func textWillChange(textInput: UITextInput) {
        // The app is about to change the document's contents. Perform any preparation here.
    }

    override func textDidChange(textInput: UITextInput) {
        // The app has just changed the document's contents, the document context has been updated.
    
        var textColor: UIColor
        var proxy = self.textDocumentProxy as UITextDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.Dark {
            textColor = UIColor.whiteColor()
        } else {
            textColor = UIColor.blackColor()
        }
        self.nextKeyboardButton.setTitleColor(textColor, forState: .Normal)
    }

}
