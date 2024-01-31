# Sandbox for GIZ(SPDCI) APIs

## Installation steps
Note - This sandbox requires [java](https://www.java.com/en/download/help/download_options.html) and [maven](https://maven.apache.org/install.html)
Clone application code using following commands
```sh
git clone https://github.com/spdci/sample-api-sandbox.git
cd sample-api-sandbox
mvn clean package
```

Above step will generate jar file inside sample-api-sandbox/target folder, Run jar using following command

```
java -jar sample-api-sandbox-0.0.1.jar
```

Database setup > We have used docker to run database server.
    
```
sudo docker-compose -f docker-compose.yaml up -d
```
After database installation run following sql to create database.

```
IbrTable.sql
SocialTable.sql
```



