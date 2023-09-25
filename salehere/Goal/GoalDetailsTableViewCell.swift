//
//  GoalDetailsTableViewCell.swift
//  salehere
//
//  Created by Anan Kaewsaart on 22/9/2566 BE.
//

import UIKit

class GoalDetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var amountText: UITextField!
    @IBOutlet weak var dateText: UITextField!
    @IBOutlet weak var accountText: UITextField!
    @IBOutlet weak var salaryText: UITextField!
    
    var viewModel: GoalDetailsViewModelProtocol = GoalDetailsViewModel()
    var pickerView = UIPickerView()
    
    let datePicker = UIDatePicker()
 
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func setupView() {
        pickerView.delegate = self
        pickerView.dataSource = self
        accountText.inputView = pickerView
        
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged)

        dateText.inputView = datePicker
    }
    
    @objc func datePickerValueChanged(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        datePicker.timeZone = TimeZone(identifier: "Asia/Bangkok")
        dateText.text = dateFormatter.string(from: sender.date)
    }
    
}

extension GoalDetailsTableViewCell: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return viewModel.output.items.count
    }
    
    // MARK: - UIPickerViewDelegate
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return viewModel.output.items[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        accountText.text = viewModel.output.items[row]
        accountText.resignFirstResponder()
    }
}
