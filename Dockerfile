FROM debian:8.5




MAINTAINER Kamil Kwiek <kamil.kwiek@continuum.io>




ENV LANG=C.UTF-8 LC_ALL=C.UTF-8




RUN apt-get update --fix-missing && apt-get install -y wget bzip2 ca-certificates \

    libglib2.0-0 libxext6 libsm6 libxrender1 \

    git mercurial subversion




RUN echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh && \

    wget --quiet https://repo.continuum.io/archive/Anaconda2-4.3.1-Linux-x86_64.sh -O ~/anaconda.sh && \

    /bin/bash ~/anaconda.sh -b -p /opt/conda && \

    rm ~/anaconda.sh




RUN apt-get install -y curl grep sed dpkg && \

    TINI_VERSION=`curl https://github.com/krallin/tini/releases/latest | grep -o "/v.*\"" | sed 's:^..\(.*\).$:\1:'` && \

    curl -L "https://github.com/krallin/tini/releases/download/v${TINI_VERSION}/tini_${TINI_VERSION}.deb" > tini.deb && \

    dpkg -i tini.deb && \

    rm tini.deb && \

    apt-get clean


#Install jupyter notebook
RUN /opt/conda/bin/conda install jupyter -y --quiet && mkdir /opt/notebooks

#Install pip
RUN  apt-get install -y python-pip python-dev build-essential 

# Install python2 libraries
RUN /opt/conda/bin/conda install -c mq pybrain=0.3.3 && rm -rf /root/.cachex


ENV PATH /opt/conda/bin:$PATH

#RUN /opt/conda/bin/jupyter notebook --notebook-dir=/opt/notebooks --ip='*' --port=8888 —#no-browser


ENTRYPOINT [ "/usr/bin/tini", "--" ]

CMD [ "/bin/bash" ]
