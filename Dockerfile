FROM centos

LABEL maintainer="Mindy Cong <mindycong@gmail.com>"

RUN curl -L -O http://appdown.rrys.tv/rrshareweb_centos7.tar.gz \
    && tar -zxvf rrshareweb_centos7.tar.gz \
    && rm -rf rrshareweb_centos7.tar.gz \
    && cd rrshareweb \
    && mkdir log \
    && mkdir -p /opt/work/store \
    && sed -i "s@\"logpath\" :.*@\"logpath\" : \"/rrshareweb/log\",@g" ./conf/rrshare.json \
    && sed -i "s@\"defaultsavepath\" :.*@\"defaultsavepath\" : \"/opt/work/store\"@g" ./conf/rrshare.json

VOLUME /opt/work/store
EXPOSE 3001

CMD ["/rrshareweb/rrshareweb"]
