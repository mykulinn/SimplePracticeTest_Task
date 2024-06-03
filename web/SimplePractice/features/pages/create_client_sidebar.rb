
  module Pages
    class CreateClientSidebar < BasePage

      element :first_name_input, :xpath, "//*[@name ='firstName']"
      element :last_name_input, :xpath, "//*[@name ='lastName']"
      element :add_email_button, :xpath,"//button[contains(., 'Add email')]"
      element :add_phone_button, :xpath,"//button[contains(., 'Add phone')]"
      element :new_email_input, :xpath,"//input[@name ='email']"
      element :new_phone_input, :xpath,"//input[@name ='phone']"
      element :continue_button, :xpath,"//button[contains(text(), 'Continue')]"

      def set_legal_first_name(name)
        sleep 0.5
        first_name_input.set name
      end

      def set_legal_last_name(last_name)
        sleep 0.5
        last_name_input.set last_name
      end

      def set_email(email)
        add_email_button.click
        new_email_input.set email
      end

      def set_phone(phone)
        add_phone_button.click
        new_phone_input.set phone
      end

      def set_client_type(type = 'adult')
        find(:xpath, "//input[@name ='clientType' and @value = '#{type}']")
      end

      def set_client_main_info(client_info)
        set_legal_first_name client_info[:first_name]
        set_legal_last_name client_info[:last_name]
        set_client_type
      end

      def set_client_additional_info(client_info)
        unless client_info[:email].nil?
          set_email client_info[:email]
        end

        unless client_info[:mobile_phone].nil?
          set_phone client_info[:mobile_phone]
        end
      end

      def tap_continue
        continue_button.click
      end
    end
  end
