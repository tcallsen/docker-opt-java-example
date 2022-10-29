#### 532mb image via multi-stage build

### Build in first stage

FROM openjdk:11-jdk-slim AS builder

# install maven and git
RUN apt-get update && apt-get install -y \
    maven \
    git \
 && apt-get clean && rm -rf /var/lib/apt/lists/*

# clone repo
RUN mkdir -p /workspace
WORKDIR /workspace
RUN git clone https://github.com/tcallsen/osm2graph-neo4j.git
WORKDIR /workspace/osm2graph-neo4j

# build repo
RUN mvn clean install


### Execute in second stage - only copy compiled binary/jar to second stage 
###   to reduce docker image size

FROM openjdk:11-jdk-slim

RUN mkdir -p /workspace
WORKDIR /workspace

COPY --from=builder /workspace/osm2graph-neo4j/target /workspace/osm2graph-neo4j

# execute loader
CMD ["java", "-jar", "osm2graph-neo4j/osm2graph-neo4j-0.0.2-SNAPSHOT.jar", "/workspace/in.osm", "/workspace/out/graph.db"]