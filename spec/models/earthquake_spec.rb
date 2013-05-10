require 'spec_helper'

describe Earthquake do
  it 'has a valid factory' do
    Factory.create(:earthquake).should be_valid
  end
end
