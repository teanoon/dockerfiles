FROM openjdk:8

ARG DYNAMODB_LOCAL_PATH="https://s3-ap-southeast-1.amazonaws.com/dynamodb-local-singapore/dynamodb_local_latest.tar.gz"
RUN mkdir /dynamodb && cd /dynamodb && \
  wget ${DYNAMODB_LOCAL_PATH} && \
  wget ${DYNAMODB_LOCAL_PATH}.sha256 && \
  sha256sum -c dynamodb_local_latest.tar.gz.sha256 && \
  tar zxf dynamodb_local_latest.tar.gz && \
  rm dynamodb_local_latest.tar.gz dynamodb_local_latest.tar.gz.sha256

WORKDIR /dynamodb
CMD [ "java", "-Djava.library.path=./DynamoDBLocal_lib", "-jar", "DynamoDBLocal.jar", "-sharedDb" ]
