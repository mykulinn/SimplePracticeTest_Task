
module Pages
  class LeftNavigationMenu < BasePage

    element :calendar_button, :xpath, "//a[@href = '/calendar' and @aria-label]"
    element :clients_button, :xpath, "//a[@href = '/clients' and @aria-label]"
    element :analytics_button, :xpath, "//a[@href = '/reports/dashboard' and @aria-label]"
    element :settings_button, :xpath, "//a[@href = '/practice_settings' and @aria-label]"

    def tap_calendar
      calendar_button.click
    end

    def tap_clients
      clients_button.click
    end

    def tap_analytics
      analytics_button.click
    end

    def tap_settings
      settings_button.click
    end
  end
end
