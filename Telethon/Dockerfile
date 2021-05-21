FROM alpine
LABEL VERSION=1.5

ENV BUILD_VERSION=1.5 \
        DEFAULT_LIST_FILE=crontab_list.sh \
        CUSTOM_LIST_MERGE_TYPE=append

RUN set -ex \
        && apk update && apk upgrade \
        && apk add --no-cache python3 py3-pip tzdata moreutils git curl jq\
        && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
        && echo "Asia/Shanghai" > /etc/timezone

RUN mkdir /logs \
        && mkdir /telethon \
        && mkdir /pss \
        && cd  /pss \
        && git init \
        && git remote add -f origin https://github.com/FKPYW/SomeScripts.git \
        && git config core.sparsecheckout true \
        && echo Telethon/* >> /pss/.git/info/sparse-checkout \
        && git pull origin master --rebase \
        && pip3 install --upgrade pip \
        && pip3 install telethon
        
RUN cp /pss/Telethon/docker_entrypoint.sh /usr/local/bin \
        && chmod +x /usr/local/bin/docker_entrypoint.sh

WORKDIR /telethon

ENTRYPOINT ["docker_entrypoint.sh"]

CMD [ "crond" ]