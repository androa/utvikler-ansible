describe x509_certificate('/etc/pki/ca-trust/source/anchors/webproxy.pem') do
  its('validity_in_days') { should be > 30 }
  its('subject.CN') { should eq "webproxy.nav.no" }
end

describe x509_certificate('/etc/pki/ca-trust/source/anchors/NAVIssuingIntern.pem') do
  its('validity_in_days') { should be > 30 }
  its('subject.CN') { should eq "NAV Issuing CA Intern" }
end

describe x509_certificate('/etc/pki/ca-trust/source/anchors/B27_Issuing.pem') do
  its('validity_in_days') { should be > 30 }
  its('subject.CN') { should eq "B27 Issuing CA Intern" }
end
