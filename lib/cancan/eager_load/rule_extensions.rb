# frozen_string_literal: true

require 'cancancan'

module CanCan
  module RuleExtensions
    def matches_non_block_conditions(subject)
      if @conditions.is_a?(Hash)
        return nested_subject_matches_conditions?(subject) if subject.class == Hash

        unless subject_class?(subject)
          subject.includes(conditions_to_includes(@conditions)) if subject.is_a?(ActiveRecord::Base)

          return matches_conditions_hash?(subject)
        end
      end

      # Don't stop at "cannot" definitions when there are conditions.
      conditions_empty? ? true : @base_behavior
    end

    private

    def conditions_to_includes(target)
      return unless target.is_a?(Hash)

      target.each_with_object({}) do |key_and_value, memo|
        key = key_and_value[0]
        value = key_and_value[1]

        memo[key] = conditions_to_includes(value) || {} if value.is_a?(Hash)

        memo
      end
    end
  end
end
