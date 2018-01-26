describe package('jenkins') do
  it { should be_installed }
end

describe user('jenkins') do
  it { should exist }
  it { should belong_to_group 'docker' }
  its('home') { should eq '/var/lib/jenkins/' }
end

describe service('jenkins') do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end
