ARG NODE_IMAGE=node:lts-alpine

FROM ${NODE_IMAGE}

# RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories
RUN apk update && apk upgrade \
    && apk add --no-cache \
        make \
        g++ \
        jpeg-dev \
        cairo-dev \
        giflib-dev \
        pango-dev \
        libtool \
        autoconf \
        automake \
        bash \
        curl \
    && rm -rf /var/cache/apk/*

# install pnpm yarn globally
RUN npm i -g pnpm yarn && pnpm --version
