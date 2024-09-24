import UIKit

class ViewController: UIViewController {

    init() {
        print("init")

        super.init(nibName: nil, bundle: nil)  // Правильный вызов суперинциализатора
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // Если переопределяете loadView(), необходимо либо вызвать super.loadView(), либо создать свое представление
    override func loadView() {
        super.loadView()  // Вызов суперинциализатора для корректной загрузки представления
        print("load view")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        print("view did load")
        view.backgroundColor = .systemPink
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
    }

    override func viewIsAppearing(_ animated: Bool) {
        super.viewIsAppearing(animated)
        print("view is appearing")
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("view will layout subviews")
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("view did layout subviews")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }

    override func viewWillTransition(to size: CGSize, with coordinator: any UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        print("view will transition")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
    }

    deinit {
        print("deinit")
    }
}
