//
//  ViewModelType.swift
//  sopt-37th-assignment
//
//  Created by 이나연 on 12/3/25.
//

protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    
    func action(_ trigger: Input)
}
