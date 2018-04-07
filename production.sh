



#######
# Docker runner script
######
sudo cp /vagrant/docker_run.sh /home/vagrant/
sudo chown vagrant:vagrant /home/vagrant/docker_run.sh

#################################### 
# SSH so that Jenkins can connect  #
####################################

sudo echo ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDWh/7HUva4ZmbAO7yQiubrQd2W3QaodY+S8U+JsRRaSq7PJbIWGhXWg++R4Fajwf8+83qSd0yPJeNlCo51E8iv8QLa3X6Ft6pteZTPa3mqMgRB47MajSJdb85tCz3rgDZ2xu16jv6pXfcQ3JqlHWbjjGmZ9+BusEAo7XCc4hHYPpnyssnV3D7Dr4euglYnpBu9E+1wYVpBOi38EI0SMA6fftEQkZgA1JyEhbuBLwXNaj5YAwPyAY2YFJADft8uU8SJD0trkN4unF4lmmuQel7L6o1U9+upZvLbl/SPH67HzV0aw/h3KksBkLJaBNAaIP688bkFnKshYoU9r2gw3eKr jenkins@jenkins >> /home/vagrant/.ssh/authorized_keys
sudo chown vagrant:vagrant /home/vagrant/.ssh/authorized_keys

###############
# prometheus
###############
cd ~
sudo useradd --no-create-home --shell /bin/false prometheus
sudo useradd --no-create-home --shell /bin/false node_exporter
sudo mkdir /etc/prometheus
sudo mkdir /var/lib/prometheus
sudo chown prometheus:prometheus /etc/prometheus
sudo chown prometheus:prometheus /var/lib/prometheus
curl -LO https://github.com/prometheus/prometheus/releases/download/v2.2.1/prometheus-2.2.1.linux-amd64.tar.gz
tar xzvf prometheus-2.2.1.linux-amd64.tar.gz
sudo cp prometheus-2.2.1.linux-amd64/prometheus /usr/local/bin/
sudo cp prometheus-2.2.1.linux-amd64/promtool /usr/local/bin/
sudo chown prometheus:prometheus /usr/local/bin/prometheus
sudo chown prometheus:prometheus /usr/local/bin/promtool
sudo cp -r prometheus-2.2.1.linux-amd64/consoles /etc/prometheus
sudo cp -r prometheus-2.2.1.linux-amd64/console_libraries /etc/prometheus
sudo chown -R prometheus:prometheus /etc/prometheus/consoles
sudo chown -R prometheus:prometheus /etc/prometheus/console_libraries
rm -rf prometheus-2.2.1.linux-amd64.tar.gz prometheus-2.2.1.linux-amd64

sudo cp /vagrant/prometheus.service /etc/systemd/system/prometheus.service
sudo cp /vagrant/prometheus.yml /etc/prometheus/prometheus.yml


####################
# Node Exporter    #
####################
cd ~
curl -LO https://github.com/prometheus/node_exporter/releases/download/v0.15.2/node_exporter-0.15.2.linux-amd64.tar.gz
tar xvfv node_exporter-0.15.2.linux-amd64.tar.gz
sudo cp node_exporter-0.15.2.linux-amd64/node_exporter /usr/local/bin
sudo chown node_exporter:node_exporter /usr/local/bin/node_exporter
rm -rf node_exporter-0.15.2.linux-amd64.tar.gz node_exporter-0.15.2.linux-amd64
sudo cp /vagrant/node_exporter.service /etc/systemd/system/node_exporter.service

##################
# Create deamon  #
##################

sudo systemctl daemon-reload
sudo systemctl start node_exporter
sudo systemctl status node_exporter

sudo systemctl daemon-reload
sudo systemctl start prometheus
sudo systemctl enable prometheus




