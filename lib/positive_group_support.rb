require "positive_group_support/version"

require "active_support"
require "active_support/core_ext"

require "positive_basic_support"
require "positive_number_support"

if RUBY_VERSION < "2.2"
  require "itself"
end

[ :array , :hash ].each do | filename |
  require_relative "positive_group_support/#{ filename }_ext"
end

module PositiveGroupSupport

  extend ::ActiveSupport::Concern

  included do

    [ :Array , :Hash ].each do | class_name |
      eval <<-INCLUDE
        ::#{ class_name }.class_eval do
          include ::PositiveGroupSupport::#{ class_name }Ext
        end
      INCLUDE
    end

  end

end

include PositiveGroupSupport
