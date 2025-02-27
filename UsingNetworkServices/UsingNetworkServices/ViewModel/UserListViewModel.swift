import Foundation

class UserListViewModel: ObservableObject {
    @Published var userList = [UserViewModel]()
    
    private var service: NetworkService
    
    init(service: NetworkService) {
        self.service = service
    }
    
    func downloadUsers() async {
        var resource = ""
        
        if service.type == "WebService" {
            resource = Constants.Urls.usersExtension
        } else {
            resource = Constants.Paths.baseUrl
        }
        
        do {
            let users = try await service.download(resource)
            
            DispatchQueue.main.async {
                self.userList = users.map(UserViewModel.init)
            }
        } catch {
            print(error)
        }
        
    }
    
}
