ARG NODE_IMAGE=node:lts-alpine

FROM ${NODE_IMAGE}

# RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories
RUN apk update \
    && apk upgrade \
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
RUN npx --yes npm-config-china@latest \
    && corepack enable \
    && corepack prepare pnpm@latest --activate \
    && pnpm config set --location=global registry "https://registry.npmmirror.com/" \
    && pnpm config set --location=global sharp_binary_host "https://npmmirror.com/mirrors/sharp" \
    && pnpm config set --location=global sharp_libvips_binary_host "https://npmmirror.com/mirrors/sharp-libvips"

CMD ["pnpm"]
