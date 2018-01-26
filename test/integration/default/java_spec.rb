describe package('java-1.7.0-openjdk-devel') do
  it { should be_installed }
end

describe package('java-1.8.0-openjdk-devel') do
  it { should be_installed }
end

describe command('mvn') do
  it { should exist }
end
