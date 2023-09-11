# teamcity-docker-on-premise
Creating an On-Premises TeamCity Server
## Install software
 - docker ( https://docs.docker.com/engine/install/debian/ )
 - docker-compose ( https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-compose-on-ubuntu-20-04 )
 - git

## Copy files and configure applications
1. Clone this repository to your home directory
    ```
    git clone https://github.com/yukha/teamcity-docker-on-premise.git .
    ```
2. Rename `config.sh` to `.config.sh`
3. Add execute permission to `.config.sh`
    ```
    chmod +x .config.sh
    ```
4. Edit `.config.sh`. Set SQL Server sa password and website root. If you want to use a self-signed SSL certificate uncomment code at the end of the file.
5. Run `./.config.sh`

## Copy or update existing SSL certificate
1. Add execute permission to `convert_cert_pfx.sh` file
    ```
    chmod +x convert_cert_pfx.sh
    ```
2. Copy a web server certificate from your CA to your home directory as `cert.pfx`
3. run `./convert_cert_pfx.sh`

## Run
Go to `/app` and start an application
```
docker network create -d bridge backend-teamcity

docker-compose -f docker-compose-sql.yml up -d

docker-compose -f docker-compose-nginx.yml up -d
```

## First start
Configure SQL Server as `sql-tc`, port 1433, user `sa`, password from your`.config.sh`.
If you need to connect to this SQL Server from outside, uncomment port 1433 in `/app/docker-compose-nginx.yml` and restart it 

## Set timezone in container
```
docker exec -it teamcity /bin/bash
apt-get update && apt-get install -y tzdata
dpkg-reconfigure tzdata
```
