import SwiftUI

#Preview {
    LoginView()
}

struct ForgotPasswordView: View{
    var body: some View{
        Image ("CareBuddy")
    }
}

struct LoginView: View {
    @State var email = ""
    @State var password = ""
    @State var isPasswordVisible: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            
            Image("CareBuddy")
                .resizable()
                .scaledToFit()
                .frame(height: 110)
            
            Text("Welcome!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding(.bottom, 15)
            
            TextField("Email", text: $email)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal, 20)
                .autocapitalization(.none)
                .keyboardType(.emailAddress)
            
            HStack(){
                if isPasswordVisible {
                    TextField("Password", text: $password)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.horizontal, 20)
                        .autocapitalization(.none)
                } else{
                    SecureField("Password", text: $password)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.horizontal, 20)
                        .autocapitalization(.none)
                }
            }.overlay(alignment: .trailing){
                Image(systemName: isPasswordVisible ? "eye": "eye.slash").onTapGesture {
                    isPasswordVisible.toggle()
                }
                .padding(.horizontal, 30)
            }
            
    
            

            
            HStack {
                Spacer()
                Button(action: {
                    ForgotPasswordView()
                }) {
                    Text("Forgot password?")
                        .font(.footnote)
                        .foregroundColor(.blue)
                        .underline()
                }
                .padding(.trailing, 20)
            }
            
            
            
            
            
            
            Button(action: {
                // Login action
            }) {
                Text("Login")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding(.horizontal, 20)
            }
            
            Text("OR")
                .font(.headline)
                .padding(.vertical, 10)
            
            Button(action: {
                // Sign in with Google action
            }) {
                HStack {
                    Image(systemName: "globe")
                    Text("Sign in with Google")
                        .font(.headline)
                }
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(10)
                .padding(.horizontal, 20)
            }
            
            Button(action: {
                // Sign in with Apple action
            }) {
                HStack {
                    Image(systemName: "applelogo")
                    Text("Sign in with Apple")
                        .font(.headline)
                }
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.black)
                .cornerRadius(10)
                .padding(.horizontal, 20)
            }
            
            Spacer()
            
            HStack {
                Text("Don't have an account?")
                    .font(.footnote)
                Button(action: {
                }) {
                    Text("Sign up")
                        .font(.footnote)
                        .foregroundColor(.blue)
                        .underline()
                }
            }
            .padding(.bottom, 20)
        }
    }
    
    struct LoginView_Previews: PreviewProvider {
        static var previews: some View {
            LoginView()
        }
    }
    
    
}
