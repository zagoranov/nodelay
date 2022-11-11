FROM kolosek/ruby-2.3.3
MAINTAINER Roman Muzyukin <r.muzyukin@gmail.com>

#RUN apt update
#RUN apt install -y vim

RUN git clone https://github.com/zagoranov/nodelay.git
WORKDIR /nodelay/

RUN bundle install
RUN rake db:migrate
RUN bundle exec rake rails:update:bin

# 3003 port is optional. usually its 3000
EXPOSE 3003

CMD ["rails", "server", "-p", "3003", "-b", "0.0.0.0"] 
 
 
#docker build -t nodelay .
#docker run -d -p 0.0.0.0:3003:3003/tcp --restart=always nodelay
