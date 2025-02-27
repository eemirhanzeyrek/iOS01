import SwiftUI

struct ContentView: View {
    @ObservedObject var userListVM: UserListViewModel
    
    init() {
        self.userListVM = UserListViewModel(service: LocalService())
    }
    
    var body: some View {
        List(userListVM.userList, id: \.id) { user in
            VStack {
                Text(user.name)
                    .font(.title2)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, alignment:.leading)
                
                Text(user.username)
                    .foregroundColor(.blue)
                    .frame(maxWidth: .infinity, alignment:.leading)
                
                Text(user.email)
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity, alignment:.leading)
            }
            
        }
        .task {
            await userListVM.downloadUsers()
        }
        
    }
}

#Preview {
    ContentView()
}
