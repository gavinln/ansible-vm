REM copy master private key
copy ".vagrant\machines\ansible-vm\virtualbox\private_key" ansible-vm-private_key

REM copy slave private keys
copy ".vagrant\machines\vm1\virtualbox\private_key" vm1-private_key
copy ".vagrant\machines\vm2\virtualbox\private_key" vm2-private_key
copy ".vagrant\machines\vm3\virtualbox\private_key" vm3-private_key
copy ".vagrant\machines\vm4\virtualbox\private_key" vm4-private_key
