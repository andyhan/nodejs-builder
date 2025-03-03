ARG NODE_IMAGE=node:lts-alpine

FROM ${NODE_IMAGE}

# RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories
RUN apk update && apk upgrade \
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

# Install pnpm via corepack
RUN corepack enable \
    && corepack prepare pnpm@latest-10 --activate \
    && pnpm config set --location=global registry "https://registry.npmmirror.com/"

CMD ["pnpm"]
