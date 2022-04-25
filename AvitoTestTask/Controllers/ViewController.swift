//
//  ViewController.swift
//  AvitoTestTask
//
//  Created by Сергей Юдин on 25.04.2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let employyesCell = EmployeesCell()
    var employees: EmployeeModel!
    let networking = NetworkService()
    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupConstraints()
        jsonRequest()
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(EmployeesCell.self, forCellReuseIdentifier: employyesCell.identifier)
    }
    
    func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func jsonRequest() {
        networking.jsonRequest { [weak self] result in
            switch result {
            case .success(let employees):
                self?.employees = employees
                self?.tableView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employees?.company.employees.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: employyesCell.identifier) as? EmployeesCell
        let sortedEmployye = employees.company.employees.sorted(by: { $0.name < $1.name })
        employees.company.employees = sortedEmployye
        let employye = employees?.company.employees[indexPath.row]
        let skills = employye?.skills.joined(separator: ", ")
        cell?.name.text = "Name: \(employye?.name ?? "-")"
        cell?.phoneNumber.text = "Phone: \(employye?.phoneNumber ?? "-")"
        cell?.skills.text = "Skills: \(skills ?? "-")"
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
