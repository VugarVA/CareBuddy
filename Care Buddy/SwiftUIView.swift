/* i love you */

import SwiftUI

#Preview {
    S()
}

struct S: View {
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
                NavigationView{
                    HStack{
                        NavigationLink(destination: ForgotPasswordView()){
                            Text("Forgot password?")
                            .font(.footnote)
                            .foregroundColor(.blue)
                            .underline()
                        }
                    }
                }
            }
            
            Button(action: {
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
            
            NavigationLink(destination: SignUpView()) {
                Text("Don't have an account? Sign up")
                    .font(.footnote)
                    .foregroundColor(.blue)
                    .underline()
                    .padding(.bottom, 20)
            }
        }
    }

    struct LaunchScreenView: View {
        var body: some View {
            VStack {
                Image("CareBuddy")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white)
        }
    }

    struct LaunchScreenView_Previews: PreviewProvider {
        static var previews: some View {
            LaunchScreenView()
        }
    }

    struct LoginView_Previews: PreviewProvider {
        static var previews: some View {
            LoginView()
        }
    }
    struct SignUpApp: App {
        var body: some Scene {
            WindowGroup {
                SignUpView()
            }
        }
    }
    
}
