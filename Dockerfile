FROM node:13.10.1-stretch
RUN apt update \
&& apt install -y python3-pip python3-dev \
&& pip3 install virtualenv \
&& mkdir ~/myprojectdir \
&& cd ~/myprojectdir \
&& virtualenv projectenv \
&& pip3 install -vU setuptools \
&& pip3 install jupyter \
&& npm install -g tslab \
&& tslab install --python=python3 \
&& mkdir /usr/notebooks

WORKDIR /usr/notebooks

CMD jupyter notebook --allow-root --ip=0.0.0.0 --port=8888
