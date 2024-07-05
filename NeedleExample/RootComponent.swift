//
//  RootComponent.swift
//  NeedleExample
//
//  Created by openobject on 2024/07/01.
//

import UIKit
import Foundation
import NeedleFoundation

final class RootComponent: BootstrapComponent {
  var prefixTitle: String { return "당신은 .. " }
  var someProperty: String { return "어떤 프로퍼티?" }
  
  var rootViewController: UIViewController {
    return RootViewController(robotComponent: robotComponent,
                              humanComponent: humanComponent)
  }
  
  var robotComponent: RobotComponent {
    return RobotComponent(parent: self)
  }
  
  var humanComponent: HumanComponent {
    return HumanComponent(parent: self)
  }
}

