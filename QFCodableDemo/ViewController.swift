//
//  ViewController.swift
//  QFCodableDemo
//
//  Created by FengQIU on 2023/11/7.
//

import UIKit
import QFCodable

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let data = loadJSONFile()
        
        // decode examples
        decodeDataWithoutErrorHandler(data)
        decodeDataWithErrorHandler(data)
        decodeDataReturnsResult(data)
        // other decode usage please see unit test and its models
    }
    
    // 1. init from data without error handler
    func decodeDataWithoutErrorHandler(_ data: Data?) {
        if let model = QFReusableResponse<[GLLiveListResponse]>.init(from: data) {
            print(model)
        }
    }
    
    // 2. init from data with error handler
    func decodeDataWithErrorHandler(_ data: Data?) {
        do {
            if let model = try QFReusableResponse<[GLLiveListResponse]>.init(data: data) {
                print(model)
            }
        } catch {
            print(error)
        }
    }
    
    // 3. parse data returns a Result
    func decodeDataReturnsResult(_ data: Data?) {
        let result = QFReusableResponse<[GLLiveListResponse]>.model(from: data)
        switch result {
        case .success(let success):
            print(success)
        case .failure(let failure):
            print(failure)
        }
    }

    private func loadJSONFile() -> Data? {
        // Get the URL of the JSON file in the test bundle
        guard let url = Bundle(for: type(of: self)).url(forResource: "example", withExtension: "json") else {
            print("Failed to find JSON file")
            return nil
        }
        do {
            // Load the JSON data from the file
            return try Data(contentsOf: url)
        } catch {
            print("Failed to load or parse JSON: \(error)")
            return nil
        }
    }

}

