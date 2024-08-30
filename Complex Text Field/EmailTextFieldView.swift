import SwiftUI

struct EmailTextFieldView: View {
    
    @Binding var email: String
    
    var opacitiy: Double {
        email.isEmpty ? 1 : 0
    }
    
    var isValidEmail: Bool {
        email.isEmpty || email.isValidEmail()
    }
    
    var body: some View {
        VStack {
            TextField("", text: $email.animation())
                .keyboardType(.emailAddress)
                .font(.title2)
                .foregroundColor(.gray)
                .autocorrectionDisabled()
                .textInputAutocapitalization(.none)
                .padding()
                .overlay(
                    Label(
                        title: { Text("Enter e-mail address") },
                        icon: { Image(systemName: "envelope.open") }
                    )
                    .allowsHitTesting(false)
                    .opacity(opacitiy)
                    .font(.title2)
                    .foregroundStyle(.gray)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .overlay(Capsule().stroke(.gray, lineWidth: 0.5))
                )
            
            if !isValidEmail {
                Text("Invalid e-mail address")
                    .foregroundStyle(.red)
                    .font(.subheadline)
                    .bold()
            }
        }
        
        
    }
}

#Preview {
    EmailTextFieldView(email: .constant(""))
}
