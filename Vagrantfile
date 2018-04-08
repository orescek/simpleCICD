ENV["LC_ALL"] = "en_US.UTF-8"

Vagrant.configure(2) do |config|
  config.ssh.forward_agent=true
    
  config.vm.define "jenkins", primary: true do |jenkins|
    jenkins.vm.box =  "ubuntu/xenial64"
    jenkins.vm.hostname = "jenkins"
    jenkins.vm.network "private_network", ip:"10.1.0.50"
    jenkins.vm.hostname = "jenkins"
    jenkins.vm.network "forwarded_port", guest: 8080, host: 8080, auto_correct: false
    jenkins.vm.provision "docker" 
    jenkins.vm.provision "shell" do |s|
       s.path = "jenkins.sh"
    end  
  end
    
  config.vm.define "production" do |production|
    production.vm.box =  "ubuntu/xenial64"
    production.vm.hostname = "production"
    production.vm.network "private_network", ip:"10.1.0.51"
    production.vm.hostname = "production"
    production.vm.network "forwarded_port", guest: 8989, host: 8989, auto_correct: false
     production.vm.network "forwarded_port", guest: 9090, host: 9090, auto_correct: false
    production.vm.provision "docker"
    production.vm.provision "shell" do |s|
       s.path = "production.sh"
    end
  end
    
end
