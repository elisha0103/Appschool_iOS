import PlaygroundSupport
import Foundation

PlaygroundPage.current.needsIndefiniteExecution = true

struct NKData: Codable {

  var pageNo     : Int?     = nil
  var resultCode : String?  = nil
  var totalCount : Int?     = nil
  var numOfRows  : Int?     = nil
  var person      : [Person]? = []
  var resultMsg  : String?  = nil

  enum CodingKeys: String, CodingKey {

    case pageNo     = "pageNo"
    case resultCode = "resultCode"
    case totalCount = "totalCount"
    case numOfRows  = "numOfRows"
    case person      = "items"
    case resultMsg  = "resultMsg"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    pageNo     = try values.decodeIfPresent(Int.self     , forKey: .pageNo     )
    resultCode = try values.decodeIfPresent(String.self  , forKey: .resultCode )
    totalCount = try values.decodeIfPresent(Int.self     , forKey: .totalCount )
    numOfRows  = try values.decodeIfPresent(Int.self     , forKey: .numOfRows  )
    person      = try values.decodeIfPresent([Person].self , forKey: .person      )
    resultMsg  = try values.decodeIfPresent(String.self  , forKey: .resultMsg  )
 
  }

//  init() {
//
//  }
    
//    public func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(pageNo, forKey: .pageNo)
//        try container.encode(totalCount, forKey: .totalCount)
//        try container.encode(numOfRows, forKey: .numOfRows)
//        try container.encode(person, forKey: .person)
//        try container.encode(resultMsg, forKey: .resultMsg)
//    }
}

struct Person: Codable {

  var koreanNm      : String? = nil
  var sexdstn       : String? = nil
  var nkPrsnDeathAt : String? = nil
  var nkPrsnDeathDe : String? = nil
  var nm            : String? = nil
  var rspofc        : String? = nil
  var brth          : String? = nil
  var birthplace    : String? = nil

  enum CodingKeys: String, CodingKey {

    case koreanNm      = "korean_nm"
    case sexdstn       = "sexdstn"
    case nkPrsnDeathAt = "nk_prsn_death_at"
    case nkPrsnDeathDe = "nk_prsn_death_de"
    case nm            = "nm"
    case rspofc        = "rspofc"
    case brth          = "brth"
    case birthplace    = "birthplace"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    koreanNm      = try values.decodeIfPresent(String.self , forKey: .koreanNm      )
    sexdstn       = try values.decodeIfPresent(String.self , forKey: .sexdstn       )
    nkPrsnDeathAt = try values.decodeIfPresent(String.self , forKey: .nkPrsnDeathAt )
    nkPrsnDeathDe = try values.decodeIfPresent(String.self , forKey: .nkPrsnDeathDe )
    nm            = try values.decodeIfPresent(String.self , forKey: .nm            )
    rspofc        = try values.decodeIfPresent(String.self , forKey: .rspofc        )
    brth          = try values.decodeIfPresent(String.self , forKey: .brth          )
    birthplace    = try values.decodeIfPresent(String.self , forKey: .birthplace    )
 
  }

//  init() {
//
//  }

}

func loadJson<T: Decodable>(data: Data) -> T{
    do{
        return try JSONDecoder().decode(T.self, from: data)
    } catch{
        fatalError("Unable To parse data: \(error)")
    }
}

let url = URL(string: "https://mocki.io/v1/3c3ba532-7159-4c71-8f70-9bdcb3ec314a")!
print("----")

let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
    // data. response, error을 활용한 데이터를 가져온 이후의 작업
    // data가 nil로서 옵셔널 바인딩에서 else 처리 된다면 끝
    guard let data = data else{
        print("nothing")
        print("\(error)")
        return
    }
    
    
    let north: NKData = loadJson(data: data)
    if let person = north.person {
        for mem in person{
            let member = mem
            print("\(String(describing: member.nm!))")
            print("\(String(describing: member.sexdstn!))")
            print("\(String(describing: member.brth!))")
            print("-----------------")
        }
    }
    
    
}

task.resume()

