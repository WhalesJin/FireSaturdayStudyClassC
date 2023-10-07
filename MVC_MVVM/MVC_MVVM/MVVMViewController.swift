//
//  MVVMViewController.swift
//  MVC_MVVM
//
//  Created by 조호준 on 2023/10/07.
//

import UIKit
import Combine

final class MVVMViewController: UIViewController {
    @IBOutlet weak var bookButton: UIButton!
    @IBOutlet weak var meatButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    
    private let viewModel = MVVMViewModel()
    private var cancellables = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
//        setUpbindings1()
        setUpbindings2()
    }

    private func setUpbindings1() {
        let bookButtonTapped = bookButton.publisher(for: .touchUpInside)
            .eraseToAnyPublisher()
        let meatButtonTapped = meatButton.publisher(for: .touchUpInside)
            .eraseToAnyPublisher()
        let input = MVVMViewModel.Input(bookButtonTapped: bookButtonTapped, meatButtonTapped: meatButtonTapped)
        
        let output = viewModel.transform1(input: input)
        
        output.book
            .receive(on: DispatchQueue.main)
            .sink { [weak self] text in
                self?.resultLabel.text = text
            }
            .store(in: &cancellables)
        
        output.meat
            .receive(on: DispatchQueue.main)
            .sink { [weak self] text in
                self?.resultLabel.text = text
            }
            .store(in: &cancellables)
    }
    
    private func setUpbindings2() {
        let bookButtonTapped = bookButton.publisher(for: .touchUpInside)
            .eraseToAnyPublisher()
        let meatButtonTapped = meatButton.publisher(for: .touchUpInside)
            .eraseToAnyPublisher()
        let input = MVVMViewModel.Input(bookButtonTapped: bookButtonTapped, meatButtonTapped: meatButtonTapped)
        
        viewModel.transform2(input: input)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] text in
                self?.resultLabel.text = text
            }
            .store(in: &cancellables)
    }
}

extension MVVMViewController {
    private func configureUI() {
        bookButton.setTitle("📚\n\n책", for: .normal)
        meatButton.setTitle("🍗\n\n고기", for: .normal)
    }
}


extension UIControl {
    struct EventPublisher: Publisher {
        typealias Output = Void
        typealias Failure = Never

        fileprivate var control: UIControl
        fileprivate var event: Event

        func receive<S: Subscriber>(subscriber: S) where S.Input == Output, S.Failure == Failure {
            let subscription = EventSubscription<S>()
            subscription.target = subscriber

            subscriber.receive(subscription: subscription)

            control.addTarget(
                subscription,
                action: #selector(subscription.trigger),
                for: event
            )
        }
    }
}

private extension UIControl {
    class EventSubscription<Target: Subscriber>: Subscription where Target.Input == Void {

        var target: Target?

        func request(_ demand: Subscribers.Demand) { }

        func cancel() {
            target = nil
        }

        @objc
        func trigger() {
             _ = target?.receive(())
        }
    }
}

extension UIControl {
    func publisher(for event: Event) -> EventPublisher {
        EventPublisher(
            control: self,
            event: event
        )
    }
}
