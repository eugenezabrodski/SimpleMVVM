//
//  MainCell.swift
//  SimpleMVVM
//
//  Created by Eugene on 30/12/2023.
//

import UIKit

class MainCell: UITableViewCell {
    
    static var identifier: String {
        "Main Cell"
    }
    
    private let name = UILabel()
    private let emailLabel = UILabel()
    private var labelsStackView = UIStackView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        name.font = .systemFont(ofSize: 16)
        emailLabel.font = .systemFont(ofSize: 14)
        
        labelsStackView = UIStackView(arrangedSubviews: [name, emailLabel])
        labelsStackView.axis = .vertical
        labelsStackView.spacing = 2
        labelsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(labelsStackView)
        
        NSLayoutConstraint.activate([
            labelsStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            labelsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
        ])
    }
    
    func setupCell(viewModel: MainCellViewModel) {
        name.text = viewModel.name
        emailLabel.text = viewModel.email
    }
}
