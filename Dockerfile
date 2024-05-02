FROM ruby:latest

RUN curl -fsSL https://deb.nodesource.com/setup_22.x | bash - && \
apt-get install -y nodejs && \
gem install jekyll && \
npm install gulp-cli -g

CMD ["/bin/bash"]
