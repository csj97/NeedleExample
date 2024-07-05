//
//  RobotComponent.swift
//  NeedleExample
//
//  Created by openobject on 2024/07/01.
//

import UIKit
import Foundation
import NeedleFoundation

protocol RobotDependency: Dependency {
  var prefixTitle: String { get }
}

final class RobotComponent: Component<RobotDependency> {
  var robotViewController: UIViewController {
    NormalSecondViewController(viewModel: viewModel)
  }
  
  var viewModel: ViewModel {
    RobotViewModel(text: "\(dependency.prefixTitle) 로봇 입니다.")
  }
  
}
