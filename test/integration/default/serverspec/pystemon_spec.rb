require 'serverspec'

# Required by serverspec
set :backend, :exec

## Use Junit formatter output, supported by jenkins
#require 'yarjuf'
#RSpec.configure do |c|
#    c.formatter = 'JUnit'
#end

describe file('/var/_pystemon/pystemon/pystemon.py') do
  it { should be_executable }
end

describe command('/var/_pystemon/pystemon/pystemon.py -h') do
  its(:stdout) { should match /Usage: pystemon.py/ }
  its(:exit_status) { should eq 0 }
end

