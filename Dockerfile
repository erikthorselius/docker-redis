FROM base
MAINTAINER Erik Thorselius <erik.thorselius@gmail.com>
RUN apt-get update
RUN apt-get install -y -q build-essential 
ADD http://download.redis.io/redis-stable.tar.gz /redis-stable.tar.gz
RUN tar xvzf redis-stable.tar.gz
WORKDIR /redis-stable
RUN make
RUN make install
RUN sysctl vm.overcommit_memory=1
EXPOSE 6379
USER daemon
ENTRYPOINT ["/usr/local/bin/redis-server"]
