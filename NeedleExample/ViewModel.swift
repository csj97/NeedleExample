//
//  ViewModel.swift
//  NeedleExample
//
//  Created by openobject on 2024/07/01.
//

import Foundation

protocol ViewModel {
  var text: String { get }
}

final class RobotViewModel: ViewModel {
  let text: String
  
  init(text: String) {
    self.text = text
  }
}

final class HumanViewModel: ViewModel {
  let text: String
  
  init(text: String) {
    self.text = text
  }
}
