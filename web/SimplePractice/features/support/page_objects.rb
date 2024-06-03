module PageObjects
  
  def login_page
    @login_page ||= Pages::LoginPage.new
  end

  def base_top_pane
    @base_top_pane ||= Pages::BaseTopPane.new
  end

  def create_client_sidebar
    @create_client_sidebar ||= Pages::CreateClientSidebar.new
  end

  def left_navigation_menu
    @left_navigation_menu ||= Pages::LeftNavigationMenu.new
  end

  def clients_and_contacts_page
    @clients_and_contacts_page ||= Pages::ClientsAndContactsPage.new
  end
end

World(PageObjects)
