FROM ruby:latest

RUN curl -fsSL https://deb.nodesource.com/setup_22.x | bash - && \
git clone https://github.com/andre-ls/nebula.git && \
apt-get install -y nodejs && \
gem install jekyll && \
npm install gulp-cli -g

WORKDIR /nebula

CMD ["/bin/bash","docker/install_dependencies.sh"]
