
  module Pages
    class BaseTopPane < BasePage

      element :create_button, :xpath, "//button[@aria-label = 'create']"
      element :create_client_button, :xpath, "//button[contains(., 'Create client')]"

      def tap_create_client
        create_button.click
        create_client_button.click
      end
    end
  end
