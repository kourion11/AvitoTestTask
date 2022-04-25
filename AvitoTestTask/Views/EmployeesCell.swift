//
//  EmployeesCell.swift
//  AvitoTestTask
//
//  Created by Сергей Юдин on 25.04.2022.
//

import UIKit
import SnapKit

class EmployeesCell: UITableViewCell {
    
    let identifier = "cell"
    
    var name: UILabel = UILabel()
    var phoneNumber: UILabel = UILabel()
    var skills: UILabel = UILabel()
    
    let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .fillEqually
        view.spacing = 5
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(name)
        stackView.addArrangedSubview(phoneNumber)
        stackView.addArrangedSubview(skills)
    }
    
    func setupConstraints() {
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(20)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
