FROM google/cloud-sdk

MAINTAINER Vishnu Nair <me@vishnudxb.me>

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["sh", "/entrypoint.sh"]
