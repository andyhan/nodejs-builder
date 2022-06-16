FROM node:lts-alpine

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories \
    && apk add --update --no-cache \
        make \
        g++ \
        jpeg-dev \
        cairo-dev \
        giflib-dev \
        pango-dev \
        libtool \
        autoconf \
        automake \
    && rm -rf /var/cache/apk/*

# install pnpm global
RUN npm i -g pnpm && pnpm config set registry https://registry.npmmirror.com/