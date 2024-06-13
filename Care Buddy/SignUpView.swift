import SwiftUI

struct SignUpView: View {
    @State var name: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State var password2: String = ""
    @State var isPasswordVisible: Bool = true
    @State var isPasswordVisible2: Bool = true
    @State var agreedToTerms: Bool = false
    @State var check: Bool = false

    
    let customBlue = Color(UIColor(red: 68/255, green: 153/255, blue: 171/255, alpha: 1.0))
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                Image("CareBuddy")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 120)
                    .offset(y: -40)
                    .padding(.top, 50)
                
                Text("Create your account")
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding(.top, 20)
                    .offset(y: -35)
                
                VStack(alignment: .leading) {
                    
                    TextField("Email", text: $email)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).strokeBorder(Color.blue, lineWidth: 1))
                        .offset(y: -30)
                        .padding(.top, 20)
                        .autocapitalization(.none)
                    
                    HStack(){
                        if isPasswordVisible {
                            TextField("Password", text: $password)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).strokeBorder(Color.blue, lineWidth: 1))
                                .offset(y: -30)
                                .padding(.top, 20)
                                .autocapitalization(.none)
                        } else{
                            SecureField("Password", text: $password)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).strokeBorder(Color.blue, lineWidth: 1))
                                .offset(y: -30)
                                .padding(.top, 20)
                                .autocapitalization(.none)
                        }
                    }.overlay(alignment: .trailing){
                                Image(systemName: isPasswordVisible ? "eye": "eye.slash").onTapGesture {
                                    isPasswordVisible.toggle()
                                }
                                .padding(.horizontal,15)
                                .offset(y: -18)
                            }
                    HStack(){
                        if isPasswordVisible2 {
                            TextField("Re-enter Password", text: $password2)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).strokeBorder(Color.blue, lineWidth: 1))
                                .offset(y: -30)
                                .padding(.top, 20)
                                .autocapitalization(.none)
                        } else{
                            SecureField("Re-enter Password", text: $password2)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).strokeBorder(Color.blue, lineWidth: 1))
                                .offset(y: -30)
                                .padding(.top, 20)
                                .autocapitalization(.none)
                        }
                    }.overlay(alignment: .trailing){
                                Image(systemName: isPasswordVisible2 ? "eye": "eye.slash").onTapGesture {
                                    isPasswordVisible2.toggle()
                                }
                                .padding(.horizontal, 15)
                                .offset(y: -18)
                    }
                }

                .padding(.horizontal, 40)

                
                
                
                
                HStack {
                    Button(action: {
                        agreedToTerms.toggle()
                    }) {
                        Image(systemName: agreedToTerms ? "checkmark.square" : "square")
                            .foregroundColor(.blue)
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    NavigationLink(destination: TermsConditions()){                    Text("I agree to the Terms and Conditions")
                            .font(.footnote)
                            .foregroundColor(.gray)
                            .underline()
                    }
                }
                .offset(y: -30)
                .padding(.horizontal, 40)
                .padding(.top, 20)

                NavigationLink(destination: LoginView().navigationBarBackButtonHidden(true)) {
                    Text("Sign up")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 200, height: 50)
                        .background(isFormValid() ? Color.blue : Color.gray)
                        .cornerRadius(10)
                }
                .offset(y: -30)
                .disabled(!isFormValid())
                .padding(.top, 20)
                
                Spacer()
                
                
                
                
                
                
                
                
                HStack(spacing: 40) {
                    Button(action: openGmail) {
                        Image("Google")
                            .resizable()
                            .padding(10)
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(customBlue, lineWidth: 2))
                    }
                    Image("Apple")
                        .resizable()
                        .padding(10)
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(customBlue, lineWidth: 2))
                    Button(action: openX) {
                        Image("X")
                            .resizable()
                            .padding(10)
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(customBlue, lineWidth: 2))
                        Image("Meta")
                            .resizable()
                            .padding(10)
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(customBlue, lineWidth: 2))
                    }
                    .padding(.bottom, 50)
                }
            }
        }
        

    }
    func isFormValid() -> Bool {
        return !password2.isEmpty && !email.isEmpty && !password.isEmpty && agreedToTerms
    }
    func openGmail() {
        let gmailURL = URL(string: "googlegmail://")!
        let webURL = URL(string: "https://mail.google.com")!
        
        if UIApplication.shared.canOpenURL(gmailURL) {
            UIApplication.shared.open(gmailURL, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.open(webURL, options: [:], completionHandler: nil)
        }
    }
    
    func openX() {
        let XURL = URL(string: "twitter://")!
        let webURL = URL(string: "https://x.com/i/flow/signup")!
        
        if UIApplication.shared.canOpenURL(XURL) {
            UIApplication.shared.open(XURL, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.open(webURL, options: [:], completionHandler: nil)
        }
    }
    struct NextPageView: View {
        var body: some View {
            Text("This is the next page")
                .font(.largeTitle)
                .padding()
        }
    }
    
    struct SignUpView_Previews: PreviewProvider {
        static var previews: some View {
            SignUpView()
        }
    }
}
#Preview {
    SignUpView()
}
