# QFCodable
A foundation codable widget like system Codable.
You can use QFCodable to replace system Codable entirely. 
QFCodable supports custom behavior, allow you to specify default value for some failed cases not just throw an error. 
QFCodable also supports to specify different name for the key, and to use specify default value for the failed parsed value or the key not found field. 


QFCodable will regard the values below as true value, if you use Bool type to receive these values. You can override this method to custom define your values.
```
static func allowedTrueValues() -> [Any]? {
    [true, 1, "1", "True", "yes"]
}
```


Example:

```
enum Gender: Int, QFCodable {
    case unknown = -1
    case female = 0
    case male = 1
}

struct TestModel: QFCodable {
    var name: String
    var uid: Int
    var gender: Gender
    var address: String
    
    static func decodingDefaultValue<CodingKeys>(for key: CodingKeys) -> Any? where CodingKeys : CodingKey {
        if key.stringValue == "gender" {
            return Gender.unknown
        }
        return nil
    }
    
    static var modelCustomPropertyMapper: [String : QFCodableKeysMapperValue]? {
        ["address": "detail.address"]
    }
}

let data = [["name": "zhangsan",
             "uid": "123456",
             "gender": "1",
             "detail": ["address": "广州市白云区光明街道12号"]
            ],
            ["name": "lisi",
             "uid": "223567",
             "detail": ["address": "上海市浦东区解放街道1号"]
            ],
            ["name": "wanwu",
             "uid": ""
            ],
            ["name": "zhaoliu"
            ]]
if let model = [TestModel].init(from: data) {
    print(model)
}
```
