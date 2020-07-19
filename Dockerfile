FROM node:latest

ARG GECKODRIVER_VER=v0.26.0
ARG FIREFOX_VER=78.0.1

RUN cd /root \
 && wget https://github.com/mozilla/geckodriver/releases/download/$GECKODRIVER_VER/geckodriver-$GECKODRIVER_VER-linux64.tar.gz \
 && tar -xf geckodriver-$GECKODRIVER_VER-linux64.tar.gz \
 && mv geckodriver /usr/local/bin/geckodriver \
    # link below is a redirect from https://www.mozilla.org/firefox/download/thanks/
 && wget https://download-installer.cdn.mozilla.net/pub/firefox/releases/$FIREFOX_VER/linux-x86_64/en-US/firefox-$FIREFOX_VER.tar.bz2 \
 && tar -xf firefox-$FIREFOX_VER.tar.bz2 \
    # firefox headless mode dependencies
 && apt-get update && apt-get install -y --no-install-recommends libgtk-3-0 libdbus-glib-1-2 \
 && mkdir npmlib && cd npmlib && npm install selenium-webdriver

COPY sample.js /root/npmlib

ENV PATH="${PATH}:/root/firefox"
