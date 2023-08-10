FROM nginx:1.13
WORKDIR usr/share/nginx/html
COPY MondmonolithFrontend/build/ .
COPY nginx/conf.prod /etc/nginx/conf.d/nginx.conf
EXPOSE 3000