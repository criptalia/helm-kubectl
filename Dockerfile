FROM dtzar/helm-kubectl

ARG VCS_REF
ARG BUILD_DATE

# Metadata
LABEL org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.name="helm-kubectl-iam" \
      org.label-schema.url="https://hub.docker.com/r/criptalia/helm-kubectl/" \
      org.label-schema.vcs-url="https://github.com/criptalia/helm-kubectl" \
      org.label-schema.build-date=$BUILD_DATE

# Note: Latest version of aws-iam-authenticator may be found at:
# https://docs.aws.amazon.com/eks/latest/userguide/configure-kubectl.html

RUN wget -q https://amazon-eks.s3-us-west-2.amazonaws.com/1.11.5/2018-12-06/bin/linux/amd64/aws-iam-authenticator -O /usr/local/bin/aws-iam-authenticator \
    && chmod +x /usr/local/bin/aws-iam-authenticator

WORKDIR /config

CMD bash
