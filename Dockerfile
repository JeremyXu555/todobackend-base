FROM ubuntu

# Prevent dpkg errors
ENV TERM=xterm-256color

# Install Python runtime
# the `python3-dev` and `libmysqlclient-dev` are necessary to install mysqlclient as the dependency
RUN apt-get update && \
    apt-get install -qy \
    python3.6 libpython3.6 virtualenv python-mysqldb \
    python3-dev libmysqlclient-dev python-pip

# Create virtual environment
# Upgrade PIP in virtual environment to latest version

RUN virtualenv -p /usr/bin/python3.6 /appenv && \
    . /appenv/bin/activate && \
    pip install pip --upgrade

# Add entrypoint script
ADD scripts/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

LABEL application=todobackend
