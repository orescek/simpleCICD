# Programs

## Prerequisites 
Vagrant and VirtualBox installed

## How to run it
Clone repository with your favorite git client

In terminal go to folder where you clone it and run: 
```bash
vagrant up
```

After that you are good to go!

## Jenkins
http://localhost:8080

### Info
Run only build and after build is finished feast your eyes with docker link :sparkles:

## Doker host with simple webservice
http://localhost:8989

### Info
Under the page you can see docker container ID so with each build this number should change

## Prometheus page
http://localhost:9090

### Info
  It has installed basic prometheus and node explorer
    
# Disclaimer
Your other Vagrant environment shouldn't use ports:
 - 8080
 - 8989
 - 9090
 
This setup will not start fully because of this problem.

# Where was tested
:heavy_exclamation_mark: Tested on Mac Os Sierra and El Capitan!  :heavy_exclamation_mark:
