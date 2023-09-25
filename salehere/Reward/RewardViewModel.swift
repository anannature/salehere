//
//  RewardViewModel.swift
//  salehere
//
//  Created by Anan Kaewsaart on 21/9/2566 BE.
//

import Foundation

protocol RewardViewModelProtocol: AnyObject {

    var input: RewardViewModelInput { get }
    var output: RewardViewModelOutput { get }
}

protocol RewardViewModelInput: AnyObject {}

protocol RewardViewModelOutput: AnyObject {
    var itemCount: Int { get }
}
class RewardViewModel: RewardViewModelProtocol {
    
    var input: RewardViewModelInput { self }
    var output: RewardViewModelOutput { self }
    var itemCount: Int {
        8
    }
}

extension RewardViewModel: RewardViewModelInput {}
extension RewardViewModel: RewardViewModelOutput {}
