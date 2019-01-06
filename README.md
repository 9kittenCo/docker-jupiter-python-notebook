# docker-jupiter-python-notebook

1. Build docker container
```
docker build . -t jpnotebook/anaconda
```

2. Create sub directory for Jupiter notebook files
```
mkdir ./noteboooks 
```
3. Launch docker container
```
docker run -i -t -p 8888:8888 -v \
        $(pwd)/notebooks:/opt/Code \
        jpnotebook/anaconda \
        /bin/bash -c "/opt/conda/bin/jupyter notebook --notebook-dir=/opt/Code --ip='*' --port=8888 --no-browser --allow-root"
```
