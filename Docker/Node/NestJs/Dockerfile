FROM node:16

COPY . /app
WORKDIR /app

RUN yarn
RUN yarn build

EXPOSE 4000
CMD ["node", "dist/src/main.js"]