FROM alpine

RUN apk update \
&& apk add curl \
&& LAST_VERSION=$(curl --silent "https://api.github.com/repos/etcd-io/etcd/releases/latest" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/') \
&& curl -L https://github.com/coreos/etcd/releases/download/$LAST_VERSION/etcd-$LAST_VERSION-linux-amd64.tar.gz -o etcd-$LAST_VERSION-linux-amd64.tar.gz \
&& tar xzvf etcd-$LAST_VERSION-linux-amd64.tar.gz \
&& rm etcd-$LAST_VERSION-linux-amd64.tar.gz \
&& cd etcd-$LAST_VERSION-linux-amd64 \
&& cp etcd /usr/local/bin/ \
&& cp etcdctl /usr/local/bin/ \
&& rm -rf etcd-$LAST_VERSION-linux-amd64 

CMD sh -c 'sleep infinity'