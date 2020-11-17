# frozen_string_literal: true

require 'cancan/eager_load/rule_extensions'

module CanCan
  class Rule
    include CanCan::RuleExtensions
  end
end
