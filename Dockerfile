FROM klakegg/hugo:0.92.1-ext-ubuntu-onbuild AS hugo

FROM nginx
COPY --from=hugo /target /usr/share/nginx/html
EXPOSE 80