FROM ruby:latest

MAINTAINER Tim Birkett <tim.birkett@theladbiblegroup.com>

RUN gem install bundle dashing puma sinatra_cyclist
RUN mkdir /dashing && \
    dashing new dashing && \
    cd /dashing && bundle && \
    ln -s /dashing/dashboards /dashboards && \
    ln -s /dashing/jobs /jobs && \
    ln -s /dashing/public /public && \
    ln -s /dashing/widgets /widgets && \
    mkdir /dashing/config && \
    mv /dashing/config.ru /dashing/config/config.ru && \
    ln -s /dashing/config/config.ru /dashing/config.ru && \
    ln -s /dashing/config /config

COPY run.sh /

VOLUME ["/dashboards", "/jobs", "/config", "/public", "/widgets"]

ENV PORT 3030
EXPOSE $PORT
WORKDIR /dashing

CMD ["/run.sh"]
