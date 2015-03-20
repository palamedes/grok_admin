require "grok_admin/version"
require "grok_admin/engine"
require "grok_admin/routing"
require "grok_admin/grok_admin_editable"

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
