FROM node:alpine as teamalpha

WORKDIR /var/app

COPY ./package.json ./

RUN npm install

COPY ./ ./

CMD ["npm","run","build"]


FROM nginx as final 

EXPOSE 80
COPY --from=teamalpha /var/app/build /usr/share/nginx/html

CMD [ "npm","run","build"]
