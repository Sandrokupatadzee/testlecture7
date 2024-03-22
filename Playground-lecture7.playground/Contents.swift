import Foundation

//შექმენით Enum-ი სახელით WeekDay შესაბამისი ქეისებით. დაწერეთ ფუნქცია რომელიც იღებს ამ ენამის ტიპს და ბეჭდავს გადაწოდებული დღე სამუშაოა თუ დასვენების.

enum WeekDay: String {
    case monday = "ორშაბათი სამუშაო დღეა"
    case tuesday = "სამშაბათი სამუშაო დღეა"
    case wednesday = "ოთხშაბათი სამუშაო დღეა"
    case thursday = "ხუთშაბათი სამუშაო დღეა"
    case friday = "პარასკევი სამუშაო დღეა"
    case saturday = "შაბათი დასვენების დღეა"
    case sunday = "კვირა დასვენების დღეა"
}

func whichDayIs(on day: WeekDay) {
    print(day.rawValue)
}

whichDayIs(on: .sunday)

//შექმენით Enum-ი სახელად GialaSquad, რომელიც აღწერს გია სურამელაშვილის ფანკლუბის წევრების დონეებს ქეისებით : “TsigroviManto”, “MoshishvlebuliMkerdi”, “TuGapatio”. შექმენით ფროფერთი GialaSquad-ში, რომელსაც ექნება ინფორმაცია თუ რა ღირს თითოეული დონე თვეში (დონეები დალაგებულია ძვირიდან იაფისაკენ). დაუმატეთ მეთოდი რომელიც დაბეჭდავს თითოეული დონის ფასს

enum GialaSquad {
    case TsigroviManto
    case MoshishvlebuliMkerdi
    case TuGapatio
    
    var priceForEachLevel: Int {
        switch self {
        case .TsigroviManto:
            return 10_000
        case .MoshishvlebuliMkerdi:
            return 20_000
        case .TuGapatio:
            return 30_000
        }
    }
    
    func getGialaSquadPrice() {
        print("TsigroviMantos price sheadgens \(self.priceForEachLevel) - s")
        print("MoshishvlebuliMkerdis price sheadgens \(self.priceForEachLevel) - s")
        print("TuGapatios price sheadgens \(self.priceForEachLevel )- s")
    }
}

let result = GialaSquad.MoshishvlebuliMkerdi
result.getGialaSquadPrice()

//შექმენით enum-ი Weather შემდეგი ქეისებით, Sunny, Cloudy, Rainy და Snowy. ამ ქეისებს უნდა ჰქონდეს associated value Celsius-ის სახით. დაწერეთ function რომელიც მიიღებს ამ enum-ს, და მოგვცემს რეკომენდაციას რა უნდა ჩავიცვათ შესაბამისი ამინდის მიხედვით.

enum Weather {
    case sunny(temperature: Int)
    case cloudy(temperature: Int)
    case rainy(temperature: Int)
    case snowy(temperature: Int)
}

func getRecommendation(for cloth: Weather ) {
    switch cloth {
        
    case .sunny(let temperature) where temperature >= 25:
        print("Put on shorts and a t-shirt")
    case .cloudy(let temperature) where temperature >= 15:
        print("Wear a raincoat, it might rain.")
    case .rainy(let temperature) where temperature >= 10:
        print("Put on a warm coat, it's snowing outside.")
    case .snowy(let temperature) where temperature < 10:
        print("Put on shorts and a t-shirt")
    default:
        print("I have no idea what to offer")
    }
}

getRecommendation(for: .cloudy(temperature: 16))

//შექმენით struct-ი Kanye, ფროფერთებით: album, releaseYear. ამის შემდეგ შექმენით array-ი Kanye-ს ტიპის, ჩაამატეთ რამოდენიმე Kanye-ს ობიექტი, და შეავსეთ მასივი კანიეებით. დაწერეთ ფუნქცია, რომელიც მიიღებს ამ კანიეების მასივს და წელს. ფუნქციამ უნდა დაგვიბრუნოს ყველა ალბომი რომელიც გამოშვებულია გადაწოდებული წლის შემდეგ და დაბეჭდოს ისინი.

struct Kanye {
    var album: String
    var releaseYear: Int
}

var kanyeArray: [Kanye] = [
    Kanye(album: "theCollegeDropout", releaseYear: 2003),
    Kanye(album: "lateRegistration", releaseYear: 2005),
    Kanye(album: "graduation", releaseYear: 2007),
    Kanye(album: "808s&Heartbreak", releaseYear: 2008),
    Kanye(album: "myBeautifulDarkTwistedFantasy", releaseYear: 2010)
]

func getAlbumAfterReleaseYear(firstArray: [Kanye], year: Int) -> [String] {
    var albumArray: [String] = []
    for element in firstArray {
        if element.releaseYear > year {
            albumArray.append(element.album)
        }
    }
    return albumArray
}

let albumArray = getAlbumAfterReleaseYear(firstArray: kanyeArray, year: 2007)
print(albumArray)

//შექმენით String-ის ტიპის lazy property wrapper სახელად, cachedData. ინიციალიზება გაუკეთეთ ქლოჟერით რომელიც აბრუნებს სტრინგს მნიშვნელობით “lazy ინიციალიზებულია”. მიწვდით ამ ფროფერთის და დაბეჭდეთ მისი მნიშვნელობა

@propertyWrapper
struct MyWrapper {
    lazy var value: String = self.initializer()
    let initializer: () -> String
    var wrappedValue: String {
        mutating get {
            return value
        }
    }
    init(wrappedValue initializer: @escaping @autoclosure () -> String) {
        self.initializer = initializer
    }
}

struct saboloo {
    @MyWrapper var cachedData: String = "lazy ინიციალიზებულია"
}

var resultss = saboloo()
print(resultss.cachedData)
