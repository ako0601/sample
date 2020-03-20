module AuthenticationMacros
    def login_user(options = {})
        options[:password] ||= "secret"
        user = FactoryBot.create :user, options
        
        visit login_path
        
        fill_in "Email", with: user.email
        fill_in "Password", with: options[:password]
        
        click_button "Login"
        user
    end
end
