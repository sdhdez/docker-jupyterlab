FROM sdavidhdez/python36
LABEL maintainer="Simon D. Hernandez <simondhdez@totum.one>"

RUN pip --no-cache-dir install \
    jupyterlab

COPY run_jupyterlab.sh /

EXPOSE 8888

# User add
ARG UID=1000
ARG GID=1000
ARG user=jupyterlab
RUN useradd -u $UID -U -ms /bin/bash $user

# Environment
USER $user
ENV USER=/home/$user
ENV HOME=/home/$user
ENV APP=/home/$user/notebooks

# Application
RUN mkdir $APP
WORKDIR $APP

CMD ["/run_jupyterlab.sh", "--allow-root", "--no-browser", "--ip=0.0.0.0"]
