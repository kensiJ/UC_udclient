require 'spec_helper'
describe 'udclient' do

  context 'with defaults for all parameters' do
    it { should contain_class('udclient') }
  end
end
