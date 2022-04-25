//
//  EmployeesModel.swift
//  AvitoTestTask
//
//  Created by Сергей Юдин on 25.04.2022.
//

import Foundation

struct EmployeeModel: Codable {
    var company: Company
}

struct Company: Codable {
    var name: String
    var employees: [Employee]
}

struct Employee: Codable {
    var name: String
    var phoneNumber: String
    var skills: [String]

    enum CodingKeys: String, CodingKey {
        case name
        case phoneNumber = "phone_number"
        case skills
    }
}
