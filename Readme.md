## jenkins login
localhost:8080

###
Current mojprojekt task

#needs cleangrant

## doker host
localhost:8989

### doker work
Manual for now:
docker load --input /vagrant/mojprojekt-<number>.tar
docker stop <runing image>
docker docker run -d -p 8989:8989 mojprojekt-<number>

# Problems:
- cannot access GitHub in my network
- cannot connect to other vagrant machine
    - ssh that is -> didnt even go to jenkins problems -> WTF all the time

# Disclaimer
Security is poor due to time

101f9d1a49ef67442e328981077e49853bd14394 

