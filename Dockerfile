FROM node:12

ENV TINI_VERSION v0.18.0

WORKDIR /app
RUN npm i -g @angular/cli

# Add Tini
ENV TINI_VERSION v0.18.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini

# Run your program under Tini
ENTRYPOINT ["/tini", "--"]
CMD ["ng", "serve", "--host", "0.0.0.0"]

EXPOSE 4200
