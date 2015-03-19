require "grok_admin/version"

module GrokAdmin

  class << self

    def application
      @application ||= ::GrokAdmin::Application.new
    end

    def test
      "Success!"
    end


  end

end
