//
//  DetailToDoTableViewController.swift
//  ToDo List
//
//  Created by Evgeniy Ryshkov on 23/10/2018.
//  Copyright © 2018 Evgeniy Ryshkov. All rights reserved.
//

import UIKit

class DetailToDoTableViewController: UITableViewController {

    @IBOutlet weak var completeButton: UIButton!
    @IBOutlet weak var titleLabel: UITextField!
    @IBOutlet weak var dueDatePicker: UIDatePicker!
    @IBOutlet weak var dueDateLabel: UILabel!
    @IBOutlet weak var noteLabel: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var dueDatePickerCellIndexPath = IndexPath(row: 2, section: 0)
    
    var isDueDatePickerShown = false {
        didSet {
            dueDatePicker.isHidden = !isDueDatePickerShown
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.delegate = self
        noteLabel.delegate = self
        
        updateDueDateLabel()
        updateSaveButton(titleLabel)
    }
    
    func updateDueDateLabel() {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        dueDateLabel.text = formatter.string(from: dueDatePicker.date)
    }
    
    func updateSaveButton(_ sender: UITextField) {
        if (sender.text?.trimmingCharacters(in: .whitespacesAndNewlines).count)! > 0 {
            saveButton.isEnabled = true
        } else {
            saveButton.isEnabled = false
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        dismissKeyboard()
        switch (indexPath.section, indexPath.row) {
        case (dueDatePickerCellIndexPath.section, dueDatePickerCellIndexPath.row - 1):
            isDueDatePickerShown.toggle()
        default:
            isDueDatePickerShown = false
        }
        tableView.beginUpdates()
        tableView.endUpdates()
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath {
        case dueDatePickerCellIndexPath:
            if isDueDatePickerShown {
                return 216
            } else {return 0}
        default:
            return 50
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: - IBActions
    @IBAction func completeButtonPressed(_ sender: UIButton) {
        dismissKeyboard()
        completeButton.isSelected.toggle()
    }
    
    @IBAction func dueDatePickerValueChanged(_ sender: UIDatePicker) {
        dismissKeyboard()
        updateDueDateLabel()
    }
    
    @IBAction func textFieldEditingChanged(_ sender: UITextField) {
        updateSaveButton(sender)
    }
    
}
