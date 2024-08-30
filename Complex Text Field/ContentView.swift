import SwiftUI

struct ContentView: View {
    
    @State private var email = ""
    
    var title: String {
        email.isEmpty ? "Enter an email" : "Current email"
    }
    
    var color: Color {
        email.isEmpty ? .red : .blue
    }
    
    var body: some View {
        VStack {
            Text(title)
                .foregroundStyle(color)
                .font(.largeTitle)
                .fontWeight(.semibold)
                .padding()
            Spacer()
            Text(email).bold()
            EmailTextFieldView(email: $email)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
