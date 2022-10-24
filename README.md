docker build . -t docker-opt-java-example:latest

docker run --name docker-opt-java-example-cont \
  --rm \
  -v /development/workspace/Madison.osm:/workspace/in.osm \
  -v /development/workspace/out2:/workspace/out \
  docker-opt-java-example:latest