cp build/Dockerfile .
docker buildx build . --output type=docker,name=elestio4test/zitadel:latest | docker load