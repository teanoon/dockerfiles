FROM python:2.7

ADD q-text-as-data.deb /
RUN dpkg -i /q-text-as-data.deb && \
    rm /q-text-as-data.deb

ENTRYPOINT ["q"]
