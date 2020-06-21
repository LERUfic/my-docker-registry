# my-docker-registry
My Docker Registry Configurations based on Joxit's docker-registry-ui.

## Tools
1. Docker
2. NGINX
3. Image registry:2
4. Image nginx

## Deploy for Production
### Deploy Docker Registry
1. Run *make-folder.sh* to create some folders
    ``` sh
    sudo bash make-folder.sh
    ```
2. Create basic auth in */auth*
    ``` sh
    sudo apt install apache2-utils
    cd /auth
    sudo htpasswd -Bc reg.passwd lerufic
    ```
3. Copy SSL file.pem and file.key to */certs*
4. Run run.sh to deploy docker registry
    ``` sh
    bash run.sh
    ```
5. Setup NGINX
    ``` sh
    sudo cp nginx.conf /etc/nginx/site-availabe/nginx.conf
    sudo ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/nginx.conf
    sudo systemctl restart nginx
    ```
### Deploy Web UI
1. Copy docker-registry-ui to /var/www
    ``` sh
    mkdir /var/www/webuiregistry
    sudo cp -r docker-registry-ui /var/www/webuiregistry
    sudo npm install
    ```
2. Setup NGINX
    ``` sh
    sudo cp docker-registry-ui/nginx.conf /etc/nginx/site-availabe/nginx.conf
    sudo ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/nginx.conf
    sudo systemctl restart nginx
    ```


## Deploy for Development
### Deploy Docker Registry
1. Run *dev_make-folder.sh* to create some folders
    ``` sh
    sudo bash dev_make-folder.sh
    ```
2. Create basic auth in *auth*
    ``` sh
    sudo apt install apache2-utils
    cd auth
    sudo htpasswd -Bc reg.passwd lerufic
    ```
3. Run run.sh to deploy docker registry
    ``` sh
    bash dev_run.sh
    ```
### Deploy Web UI
1. Setup NGINX service using docker
    ``` sh
    cd docker-registry-ui
    docker build -t nginx-test .
    docker run --name mynginxui -p 80:80 -d nginx-test
    ```

## Thank You
Thank you for Joxit and the community for creating this awesome web ui.  
This is the link if you guys want to check out the web ui.  
https://github.com/Joxit/docker-registry-ui  
