FROM nginx:1.25-alpine
RUN apk add --no-cache bash gettext

COPY nginx.conf.template /etc/nginx/templates/default.conf.template
ENV PORT=8080

CMD sh -c "envsubst '\${PORT} \${UPSTREAM_URL}' < /etc/nginx/templates/default.conf.template > /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'"
