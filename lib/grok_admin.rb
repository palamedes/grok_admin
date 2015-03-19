require "grok_admin/version"

module GrokAdmin

  class << self

    attr_accessor :application

    def application
      @application ||= ::GrokAdmin::Application.new
    end

    def test
      "Success!"
    end


  end

end
