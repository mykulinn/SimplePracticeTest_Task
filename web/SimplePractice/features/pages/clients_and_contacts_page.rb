
module Pages
  class ClientsAndContactsPage < BasePage
    include RSpec::Matchers

    element :search_input, :xpath, "//input[@name = 'utility-search']"

    def set_search_input(search_value)
      search_input.set search_value
    end

    def search_for_client(client)
      client_full_name = client[:first_name] + ' ' + client[:last_name]
      set_search_input client_full_name
      set_search_criteria
    end

    def set_search_criteria(criteria_option = 'Clients')
      find(:xpath, "//div[@class = '_dropdown_filter_component_g9xnyp ember-view']//*[@class = 'ember-basic-dropdown']").click
      find(:xpath, "//div[@class = 'item ember-view']//*[text() = '#{criteria_option}']").click
    end

    def verify_user_exists(user)
      user_full_name = user[:first_name] + ' ' + user[:last_name]
      user_to_verify = {full_name: user_full_name, phone_number: user[:mobile_phone].gsub(/\D/, '')}

      expect(retrieve_displayed_users).to include(user_to_verify)
    end

    def retrieve_displayed_users
      sleep 5
      users = []
      find_all(:xpath, "//div[contains(@class, 'client-list-item client')]").each do |contact|
        full_name = contact.find(:xpath, "//a[@class = 'ember-view record-name']").text
        phone_number_element = contact.find(:xpath, "//a[contains(@href, 'tel')]") rescue nil

        phone_number = phone_number_element ? phone_number_element.text : nil

        users << { full_name: full_name, phone_number: phone_number.gsub(/\D/, '') }
      end
      users
    end
  end
end
