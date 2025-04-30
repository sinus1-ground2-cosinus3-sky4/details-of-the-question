FROM node:20-alpine

RUN apk add --no-cache nano

RUN addgroup app_group
RUN adduser -D -G app_group -h /home/app_user -s /bin/sh app_user

WORKDIR /work_dir

RUN npm init -y
RUN npm install ethers@latest

COPY . .
RUN chown -R app_user:app_group /work_dir

USER app_user:app_group
CMD ["tail", "-f", "/dev/null"]
