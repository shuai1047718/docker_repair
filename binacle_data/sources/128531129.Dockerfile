# Build the manager binary
FROM golang:1.10.3 as builder

RUN apt-get update && apt-get install -y apt-utils
RUN apt-get install -y make

# Install kubebuilder
WORKDIR /scratch
ENV version=1.0.8
ENV arch=amd64
RUN curl -L -O "https://github.com/kubernetes-sigs/kubebuilder/releases/download/v${version}/kubebuilder_${version}_linux_${arch}.tar.gz"
RUN tar -zxvf kubebuilder_${version}_linux_${arch}.tar.gz
RUN mv kubebuilder_${version}_linux_${arch} kubebuilder && mv kubebuilder /usr/local/
ENV PATH=$PATH:/usr/local/kubebuilder/bin:/usr/bin

# Install OPA
WORKDIR /usr/bin
RUN curl -L -o opa https://github.com/open-policy-agent/opa/releases/download/v0.10.5/opa_linux_amd64
RUN chmod 755 opa

# Copy in the go src
WORKDIR /go/src/github.com/open-policy-agent/frameworks/constraint
COPY .    .

ENTRYPOINT ["make", "docker-internal-test"]
