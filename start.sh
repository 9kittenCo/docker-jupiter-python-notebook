#!/bin/bash

docker run -i -t -p 8888:8888 -v $(pwd)/notebooks:/opt/Code salomonk/anaconda \
	/bin/bash -c "/opt/conda/bin/jupyter notebook --notebook-dir=/opt/Code --ip='*' --port=8888 --no-browser --allow-root"
