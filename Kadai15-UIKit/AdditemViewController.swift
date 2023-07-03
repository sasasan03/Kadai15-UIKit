//
//  AdditemViewController.swift
//  Kadai15-UIKit
//
//  Created by sako0602 on 2023/07/01.
//

import UIKit

protocol AddItemViewControllerDelegate: AnyObject {
    func didSaveItem(name: String)
}

class AdditemViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    weak var delegate: AddItemViewControllerDelegate?
    
    @IBAction private func didSaveItemButton(_ sender: Any){
        guard let itemName = textField.text else { return }
        delegate?.didSaveItem(name: itemName)
        dismiss(animated: true)
    }
    
    @IBAction private func didTapCancelButton(_ sender: Any){
        dismiss(animated: true)
    }

}
