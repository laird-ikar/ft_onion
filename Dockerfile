FROM ubuntu/nginx

# install tor & ssh
RUN apt-get update && apt-get install -y tor
RUN apt-get install -y openssh-server

# copy torrc
COPY torrc /etc/tor/torrc

# copy nginx config
COPY nginx.conf /etc/nginx/nginx.conf

# copy index.html & media
COPY index.html /var/www/html/index.html
COPY media /var/www/html/media

# copy sshd_config
COPY sshd_config /etc/ssh/sshd_config

# add user
RUN useradd -ms /bin/bash user
RUN echo 'user:user' | chpasswd

# expose port 80
EXPOSE 80
EXPOSE 4242

# start tor
CMD service ssh start && service tor start && nginx -g "daemon off;"