//
//  MVVMViewModel.swift
//  MVC_MVVM
//
//  Created by 조호준 on 2023/10/07.
//

import Foundation
import Combine

final class MVVMViewModel {
    struct Input {
        let bookButtonTapped: AnyPublisher<Void, Never>
        let meatButtonTapped: AnyPublisher<Void, Never>
    }
    
    struct Output {
        let book: AnyPublisher<String, Never>
        let meat: AnyPublisher<String, Never>
    }
    
    private let model = Model()

    func transform1(input: Input) -> Output {
        let book = input.bookButtonTapped
            .map { [weak self] _ in
                self?.model.saveUserDefaults(.book)
            }
            .map { _ in
                return "\(Model.Category.book.rawValue)을(를) 좋아하는 성격입니다.^^"
            }
            .eraseToAnyPublisher()
        
        let meat = input.bookButtonTapped
            .map { [weak self] _ in
                self?.model.saveUserDefaults(.meat)
            }
            .map { _ in
                return "\(Model.Category.meat.rawValue)을(를) 좋아하는 성격입니다.^^"
            }
            .eraseToAnyPublisher()
        
        return Output(book: book, meat: meat)
    }
    
    func transform2(input: Input) -> AnyPublisher<String, Never> {
        let book = input.bookButtonTapped
            .map { _ in
                return Model.Category.book
            }
        
        let meat = input.meatButtonTapped
            .map { _ in
                return Model.Category.meat
            }
        
        let dataSaved = Publishers.Merge(book, meat)
            .map { [weak self] category in
                self?.model.saveUserDefaults(category)
                
                return category
            }
            .map { category in
                return "\(category.rawValue)을(를) 좋아하는 성격입니다.^^"
            }
            .eraseToAnyPublisher()
        
        return dataSaved
    }
}
