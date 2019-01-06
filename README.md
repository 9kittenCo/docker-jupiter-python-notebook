# Work with jupiter python notebook with help of docker container.

1. Build docker container
```bash
docker build . -t jpnotebook/anaconda
```

2. Create sub directory for Jupiter notebook files
```bash
mkdir ./noteboooks 
```
3. Launch docker container
```bash
sh start.sh
```
