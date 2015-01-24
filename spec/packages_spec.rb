require 'spec_helper'

['lxc-docker'].each do |value|
  describe package(value) do
    it { should be_installed }
  end
end

['puppet', 'facter'].each do |value|
  describe package(value) do
    it { should be_installed.by('gem') }
  end
end
