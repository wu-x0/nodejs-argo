FROM node:alpine3.22

WORKDIR /tmp

COPY index.js index.html package.json ./

# blitz.cloud 要求应用监听 8080 端口，直接在镜像里设好，
# 部署时就不用再手动改 PORT 了
ENV PORT=8080

EXPOSE 8080/tcp

RUN apk update && apk upgrade &&\
  apk add --no-cache openssl curl gcompat iproute2 coreutils &&\
  apk add --no-cache bash &&\
  chmod +x index.js &&\
  npm install

CMD ["node", "index.js"]
