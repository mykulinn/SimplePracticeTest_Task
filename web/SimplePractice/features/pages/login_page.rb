
  module Pages
    class LoginPage < BasePage

      element :login_button, :xpath, "//input[@value = 'Sign In']"
      element :email_input, :id, 'user_login'
      element :password_input, :id, 'user_password'

      def log_in(username, password)
        email_input.set username
        password_input.set password
        login_button.click
      end
    end
  end
