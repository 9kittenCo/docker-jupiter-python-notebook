# docker-jupiter-python-notebook
dockerfile for jupiter notebook


docker run -i -t -p 8888:8888 -v path_to_notebook:/opt/Code salomonk/anaconda /bin/bash -c "/opt/conda/bin/jupyter notebook --notebook-dir=/opt/Code --ip='*' --port=8888 --no-browser"
