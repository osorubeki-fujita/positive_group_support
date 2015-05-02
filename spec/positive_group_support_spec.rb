require 'spec_helper'
require 'deplo'

spec_filename = ::File.expand_path( ::File.dirname( __FILE__ ) )
version = "0.1.2"

puts "Ruby Version: #{ RUBY_VERSION }"
puts ""

describe PositiveGroupSupport do
  it "has a version number \'#{ version }\'" do
    expect( ::PositiveGroupSupport::VERSION ).to eq( version )
    expect( ::Deplo.version_check( ::PositiveGroupSupport::VERSION , spec_filename ) ).to eq( true )
  end
end

require_relative 'positive_group_support_spec/array_ext.rb'
