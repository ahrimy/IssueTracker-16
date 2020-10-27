//
//  AddAlertViewController.swift
//  IssueTracker
//
//  Created by woong on 2020/10/27.
//

import UIKit

protocol AddAlertViewControllerDelegate: class {
    func addAlertViewController<InputView>(_ addAlertViewController: AddAlertViewController, didTabAddWithTextFields: [InputView])
    
    func addAlertViewControllerDidCancel(_ addAlertViewController: AddAlertViewController)
}

class AddAlertViewController: UIViewController {
    
    typealias InputView = UITextField
    
    // MARK: - Views
    
    @IBOutlet weak private var contentStackView: UIStackView!
    
    // MARK: - Properties
    
    weak var delegate: AddAlertViewControllerDelegate?
    private var inputViews: [InputView] {
        return contentStackView.arrangedSubviews.compactMap { $0 as? InputView }
    }
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Methods
    
    func addInputView(title: String, placeholder: String) {
        let inputView = InputView()
        inputView.text = title
        inputView.placeholder = placeholder
        contentStackView.addArrangedSubview(inputView)
    }
    
    func addInputView(_ inputView: InputView) {
        
    }
    
    // MARK: Private
    
    // MARK: IBActions
    
    @IBAction private func touchedCancelButton(_ sender: UIButton) {
        dismiss(animated: true) { [weak self] in
            guard let self = self else { return }
            self.delegate?.addAlertViewControllerDidCancel(self)
        }
    }
    
    @IBAction private func touchedAddButton(_ sender: UIButton) {
        delegate?.addAlertViewController(self, didTabAddWithTextFields: inputViews)
    }
    
    @IBAction private func touchedClearButton(_ sender: UIButton) {
        inputViews.forEach { $0.text = "" }
    }
}
