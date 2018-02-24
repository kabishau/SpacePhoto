import Foundation


struct PhotoInfoController {
    
    func fetchPhotoInfo(completion: @escaping (PhotoInfo?) -> Void) {
        let baseURL = URL(string: "https://api.nasa.gov/planetary/apod")!
        let query: [String: String] = ["api_key": "DEMO_KEY", "date": "2012-10-25"]
        let url = baseURL.withQueries(query)!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            let jsonDecoder = JSONDecoder()
            if let data = data, let photoInfo = try? jsonDecoder.decode(PhotoInfo.self, from: data) {
                print("works")
                completion(photoInfo)
            } else {
                print("Either no data was returned, or data was not serialized.")
                completion(nil)
            }
        }
        task.resume()
    }
}
