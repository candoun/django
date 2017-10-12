FROM django:1.8.5-python2

WORKDIR /usr/src/app

RUN apt-get update && apt-get install -y \
		make \
		vim \
		telnet \
	--no-install-recommends && rm -rf /var/lib/apt/lists/*
	
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
RUN set -ex;\
    find /usr/local -depth \
	\( \
	    \( -type d -a \( -name test -o -name tests \) \) \
		-o \
	    \( -type f -a \( -name '*.pyc' -o -name '*.pyo' \) \) \
	\) -exec rm -rf '{}' +; \
    rm requirements.txt

CMD ["/bin/bash"]
