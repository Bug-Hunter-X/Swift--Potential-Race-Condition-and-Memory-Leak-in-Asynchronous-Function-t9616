class ViewController: UIViewController {
    func fetchData(completion: @escaping (Result<[String], Error>) -> Void) {
        // Simulate network request
        DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
            if Bool.random() {
                completion(.success(["Data 1", "Data 2", "Data 3"]))
            } else {
                completion(.failure(NSError(domain: "Network error", code: 0, userInfo: nil)))
            }
        }
    }

    func someOtherMethod() {
        fetchData { [weak self] result in
            guard let self = self else { return }
            // Handle the result here
            switch result {
            case .success(let data):
                print("Received data: "
                     + data.joined(separator: ", "))
            case .failure(let error):
                print("Error fetching data: "
                     + error.localizedDescription)
            }
        }
    }
} 
