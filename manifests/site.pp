node slave1.puppet {
  package { "httpd": ensure => 'latest' }
 }

node slave2.puppet {
  package { "httpd": ensure => 'latest' }
 }
