describe package('container-selinux') do
  it { should_not be_installed }
end

describe package('docker-ce') do
  it { should be_installed }
end

describe service('docker') do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end

describe x509_certificate('/etc/pki/ca-trust/source/anchors/dockeradeono.pem') do
  its('validity_in_days') { should be > 30 }
  its('subject.CN') { should eq "docker.adeo.no" }
end
