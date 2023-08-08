# Stage1: gpu_burn build
ARG CUDA_VERSION=11.4.3
ARG IMAGE_DISTRO=ubi8

FROM nvidia/cuda:${CUDA_VERSION}-devel-${IMAGE_DISTRO} AS gpu-builder

WORKDIR /build

RUN yum -y update && yum install -y git
RUN git clone https://github.com/wilicc/gpu-burn.git .
RUN make

FROM nvidia/cuda:${CUDA_VERSION}-runtime-${IMAGE_DISTRO} AS runtime-base

COPY --from=gpu-builder /build/gpu_burn /app/
COPY --from=gpu-builder /build/compare.ptx /app/

# Stage2: go build
FROM golang:1.19 as go-builder
WORKDIR /go/src/app
COPY ./main.go ./
RUN go mod init app
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o app .

FROM runtime-base
COPY --from=go-builder /go/src/app/app /app/

WORKDIR /app
CMD ["./app"]
