//
//  QFCodableTests.swift
//  QFCodableTests
//
//  Created by FengQIU on 2023/11/7.
//

import XCTest
@testable import QFCodable

final class QFCodableTests: XCTestCase {

    var jsonData: Data!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        loadJSONFile()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        jsonData = nil
        try super.tearDownWithError()
    }

    func testDecodeJsonToModel() {
        let model = QFReusableResponse<[GLLiveListResponse]>.init(from: jsonData)
        XCTAssertNotNil(model)
        // attention: code in json file is string, and we use Int to receive it in model
        XCTAssertEqual(model?.code, 0)
        XCTAssertEqual(model?.message, "success")
        XCTAssertEqual(model?.data?.count, 1)
        
        let liveResponse = model?.data?.first
        XCTAssertNotNil(liveResponse)
        XCTAssertEqual(liveResponse?.id, 0)
        XCTAssertEqual(liveResponse?.biz, "hot")
        XCTAssertEqual(liveResponse?.subBiz, "idx")
        // attention: isLastPage in json file is number, and we use Bool to receive it in model
        XCTAssertEqual(liveResponse?.isLastPage, true)
        XCTAssertEqual(liveResponse?.data?.count, 5)
        XCTAssertEqual(liveResponse?.name, nil)
        XCTAssertEqual(liveResponse?.message, nil)
        XCTAssertEqual(liveResponse?.img, nil)
        XCTAssertEqual(liveResponse?.moduleType, "hot")
        

        let liveItem = liveResponse?.data?[1]
        XCTAssertNotNil(liveItem)
        XCTAssertEqual(liveItem?.type, .live)
        XCTAssertNil(liveItem?.bannerDataVO)
        XCTAssertNotNil(liveItem?.anchorDataVO)
        // attention: uid is required in the model, and it is received from the userId of anchorDataVO in json file which is a string type
        XCTAssertEqual(liveItem?.uid, 69719979302)
        // attention: layout is required in the model, and it is received from `anchorDataVO.streamInfo.extend.layout`
        XCTAssertEqual(liveItem?.layout, "[{\"mic\":0,\"uid\":69719979302}]")
        
        // attention: the type field of the last item of liveResponse?.data is missing.
        // And the type filed in the model is required. 
        // With the specified default value of the type key, it will use .unknown as its value.
        /*
         static func decodingDefaultValue<CodingKeys>(for key: CodingKeys) -> Any? where CodingKeys : CodingKey {
             if key.stringValue == "type" {
                 return GLLiveListItemType.unknown
             }
             return nil
         }
         */
        
        let unknownItem = liveResponse?.data?.last
        XCTAssertEqual(unknownItem?.type, .unknown)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    private func loadJSONFile() {
        // Get the URL of the JSON file in the test bundle
        guard let url = Bundle(for: type(of: self)).url(forResource: "example", withExtension: "json") else {
            print("Failed to find JSON file")
            return
        }
        do {
            // Load the JSON data from the file
            jsonData = try Data(contentsOf: url)
        } catch {
            print("Failed to load or parse JSON: \(error)")
        }
    }
}
