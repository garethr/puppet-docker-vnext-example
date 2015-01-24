require 'spec_helper'

['docker'].each do |service_name|
  describe service(service_name) do
    it { should be_enabled }
    it { should be_running.under('upstart') }
  end
end

['docker-vnext'].each do |service_name|
  describe service(service_name) do
    it { should be_enabled }
  end
end
