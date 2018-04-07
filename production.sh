



#######
# Docker runner script
######
sudo cp /vagrant/docker_run.sh /home/vagrant/
sudo chown vagrant:vagrant /home/vagrant/docker_run.sh

###### 
# SSH so that Jenkins can connect
##########

sudo echo ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDWh/7HUva4ZmbAO7yQiubrQd2W3QaodY+S8U+JsRRaSq7PJbIWGhXWg++R4Fajwf8+83qSd0yPJeNlCo51E8iv8QLa3X6Ft6pteZTPa3mqMgRB47MajSJdb85tCz3rgDZ2xu16jv6pXfcQ3JqlHWbjjGmZ9+BusEAo7XCc4hHYPpnyssnV3D7Dr4euglYnpBu9E+1wYVpBOi38EI0SMA6fftEQkZgA1JyEhbuBLwXNaj5YAwPyAY2YFJADft8uU8SJD0trkN4unF4lmmuQel7L6o1U9+upZvLbl/SPH67HzV0aw/h3KksBkLJaBNAaIP688bkFnKshYoU9r2gw3eKr jenkins@jenkins >> /home/vagrant/.ssh/authorized_keys
sudo chown vagrant:vagrant /home/vagrant/.ssh/authorized_keys