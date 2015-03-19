require "grok_admin/version"
require "engine"

module GrokAdmin

  class << self

    attr_accessor :core

    def initialize
      @core ||= ::GrokAdmin::Core.new
    end

  end


  # Core to the application
  class Core

    def test
      "Core Success"
    end

  end


end
