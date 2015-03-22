require "grok_admin/version"
require "grok_admin/engine"
require "grok_admin/routing"
require "grok_admin/grok_admin_editable"

module GrokAdmin

  PAGINATION_SIZE = 5

  # TODO For now pagination size is a constant but I shoudl change it to a config somewhere and add a method
  # here to get those config settings.
  #
  # class << self
  #
  #   attr_accessor :core
  #
  #   def initialize
  #     @core ||= ::GrokAdmin::Core.new
  #   end
  #
  # end
  #
  #
  # # Core to the application
  # class Core
  #
  #   def test
  #     "Core Success"
  #   end
  #
  # end


end
