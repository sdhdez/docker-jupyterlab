FROM sdavidhdez/python36
LABEL maintainer="Simon D. Hernandez <simondhdez@totum.one>"

RUN pip --no-cache-dir install \
    jupyterlab

COPY run_jupyterlab.sh /

EXPOSE 8888

CMD ["/run_jupyterlab.sh", "--allow-root", "--no-browser", "--ip=0.0.0.0"]
