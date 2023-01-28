FROM node:16

COPY . /app
WORKDIR /app

RUN yarn
RUN yarn run build

EXPOSE 3000
CMD ["yarn", "start"]