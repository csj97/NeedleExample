//
//  ViewController.swift
//  NeedleExample
//
//  Created by openobject on 2024/07/01.
//

import UIKit

class ViewController: UIViewController {
  let robotComponent: RobotComponent
  let humanComponent: HumanComponent
  
  private let questionLabel: UILabel = UILabel()
  private let stackView: UIStackView = UIStackView()
  private let humanButton: UIButton = UIButton(configuration: .filled())
  private let robotButton: UIButton = UIButton(configuration: .filled())
  
  init(robotComponent: RobotComponent, humanComponent: HumanComponent) {
    self.robotComponent = robotComponent
    self.humanComponent = humanComponent
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setup()
  }
  
  private func setup() {
    setLayout()
    setUI()
  }
  
  private func setLayout() {
    questionLabel.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(questionLabel)
    questionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    questionLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 120).isActive = true
    
    view.addSubview(stackView)
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.centerXAnchor.constraint(equalTo: questionLabel.centerXAnchor).isActive = true
    stackView.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 50).isActive = true
    stackView.widthAnchor.constraint(equalToConstant: 300).isActive = true
    
    stackView.addArrangedSubview(humanButton)
    stackView.addArrangedSubview(robotButton)
  }
  
  private func setUI() {
    questionLabel.text = "당신은 사람입니까?"
    stackView.spacing = 20
    humanButton.setTitle("사람입니다", for: .normal)
    let humanAction = UIAction { _ in
      self.tapPeople()
    }
    humanButton.addAction(humanAction, for: .touchUpInside)
    
    robotButton.setTitle("로_봇-입_니-다", for: .normal)
    let robotAction = UIAction { _ in
      self.tapRobot()
    }
    robotButton.addAction(robotAction, for: .touchUpInside)
  }
  
  private func tapPeople() {
    let viewModel = HumanViewModel(text: "사람 입니다 🙆")
    let viewController = NormalSecondViewController(viewModel: viewModel)
    present(viewController, animated: true)
  }
  
  private func tapRobot() {
    let viewModel = RobotViewModel(text: "로봇 입니다 🤖")
    let viewController = NormalSecondViewController(viewModel: viewModel)
    present(viewController, animated: true)
  }
}

final class NormalSecondViewController: UIViewController {
  var titleLabel: UILabel = UILabel()
  let viewModel: ViewModel
  
  init(viewModel: ViewModel) {
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(titleLabel)
    titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 120).isActive = true
    titleLabel.font = .systemFont(ofSize: 40)
    titleLabel.textAlignment = .center
    
    titleLabel.text = viewModel.text
  }
}
