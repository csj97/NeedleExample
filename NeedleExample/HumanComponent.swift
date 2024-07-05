//
//  PeopleComponent.swift
//  NeedleExample
//
//  Created by openobject on 2024/07/01.
//

import UIKit
import Foundation
import NeedleFoundation

protocol HumanDependency: Dependency {
  var prefixTitle: String { get }
  var someProperty: String { get }
}

final class HumanComponent: Component<HumanDependency> {
  public var humanViewController: UIViewController {
    return NormalSecondViewController(viewModel: viewModel)
  }
  
  public var viewModel: ViewModel {
    return HumanViewModel(text: "\(dependency.prefixTitle) 사람입니다.")
  }
}
