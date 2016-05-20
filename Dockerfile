FROM debian:jessie

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -qy install --no-install-recommends python python-pip ca-certificates build-essential python-dev atool bzip2 libffi-dev libssl-dev
RUN pip install --upgrade pip && pip install https://github.com/jsza/tempus-map-updater/zipball/master
RUN adduser --uid 5000 --disabled-password --gecos "" steam

USER steam

WORKDIR /home/steam
ENTRYPOINT ["/usr/local/bin/twistd", "-n", "mapupdater"]
