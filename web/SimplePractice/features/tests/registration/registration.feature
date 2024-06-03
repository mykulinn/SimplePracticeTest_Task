Feature: Registration

  Scenario: Verify Admin user is able to create a new client
    Given I am on application login page
    And I use 'new_client' user data faker
    And I log in as 'admin' user
    And I 'tap_create_client' on 'base_top_pane'
    And I 'set_client_main_info' on 'create_client_sidebar' using 'new_client' variable
    And I 'set_client_additional_info' on 'create_client_sidebar' using 'new_client' variable
    And I 'tap_continue' on 'create_client_sidebar'
    And I 'tap_clients' on 'left_navigation_menu'
    And I 'search_for_client' on 'clients_and_contacts_page' using 'new_client' variable
    Then I 'verify_user_exists' on 'clients_and_contacts_page' using 'new_client' variable
