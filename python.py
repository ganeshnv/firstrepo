#! python

open('test.txt', 'w')


python

pip  -- tool to manage dependencies
virtualenv   -- python library

pip install virtualenv

pyvenv myenv

source myenv/bin/activate   --activate an environment

pip install whois

vim whois.py

import whois
w = whois.query('google.com')
print(w.name)
print(w.creation_date)
print(w.name_servers)
print(w.last_updated)

python whois.py


=======

Network management -- netmiko library

pip install netmiko

input_data = input("Enter the IP address: ")

Import getpass

