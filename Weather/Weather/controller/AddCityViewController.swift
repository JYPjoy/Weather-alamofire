//
//  AddCityViewController.swift
//  Weather
//
//  Created by Jiyoung Park on 2021/10/05.
//

import UIKit

class AddCityViewController: UIViewController {
    
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    @IBOutlet weak var statusLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupGestures()
    }
    
    private func setupViews() {
        view.backgroundColor = UIColor.init(white: 0.3, alpha: 0.4)
        cityTextField.becomeFirstResponder()
    }
    
    private func setupGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissViewController))
        tapGesture.delegate = self
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc private func dismissViewController() {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func searchButtonTapped(_ sender: Any) {
    }
    
}

extension AddCityViewController: UIGestureRecognizerDelegate {
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        return touch.view == self.view
    }
}
