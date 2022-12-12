FROM klakegg/hugo:0.107.0-ext-ubuntu-onbuild AS hugo

FROM nginx
COPY --from=hugo /target /usr/share/nginx/html
COPY nginx.conf /etc/nginx/nginx.conf
EXPOSE 80
