FROM alpine
LABEL VERSION=1.0

RUN set -ex \
        && apk update && apk upgrade \
        && apk add --no-cache python3 py3-pip tzdata moreutils git curl jq\
        && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
        && echo "Asia/Shanghai" > /etc/timezone

RUN pip3 install --upgrade pip \
        && pip3 install requests

# 配置镜像仓库配置相关文件夹
# 创建工作目录
RUN mkdir /logs \
        && mkdir /scripts \
        && cd /scripts \
        && git init \
        && git remote add -f origin https://github.com/FKPYW/SomeScripts.git \
        && git config core.sparsecheckout true \
        && echo mimotion/* >> /scripts/.git/info/sparse-checkout \
        && git pull origin master \
        && cp /scripts/mimotion/docker_entrypoint.sh /usr/local/bin \
        && chmod +x /usr/local/bin/docker_entrypoint.sh

WORKDIR /scripts/mimotion

#镜像构建版本,每次调整构建文件更新
ENV BUILD_VERSION=1.0 \
        DEFAULT_LIST_FILE=crontab_list.sh \
        CUSTOM_LIST_MERGE_TYPE=append

ENTRYPOINT ["docker_entrypoint.sh"]

CMD [ "crond" ]