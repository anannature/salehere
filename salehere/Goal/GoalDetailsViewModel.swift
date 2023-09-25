//
//  GoalDetailsViewModel.swift
//  salehere
//
//  Created by Anan Kaewsaart on 22/9/2566 BE.
//

import Foundation

protocol GoalDetailsViewModelProtocol: AnyObject {

    var input: GoalDetailsViewModelInput { get }
    var output: GoalDetailsViewModelOutput { get }
}

protocol GoalDetailsViewModelInput: AnyObject {}

protocol GoalDetailsViewModelOutput: AnyObject {
    var items: [String]  { get }
}
class GoalDetailsViewModel: GoalDetailsViewModelProtocol {
    
    var input: GoalDetailsViewModelInput { self }
    var output: GoalDetailsViewModelOutput { self }
    var items: [String] {
        ["115729", " 382156", "329156"]
    }
}

extension GoalDetailsViewModel: GoalDetailsViewModelInput {}
extension GoalDetailsViewModel: GoalDetailsViewModelOutput {}
