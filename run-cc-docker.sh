# Cross compile docker image for TogetheROS
FILE="pc_tros_ubuntu22.04_v1.0.0.tar.gz"
URL="http://archive.d-robotics.cc/TogetheROS/cross_compile_docker/pc_tros_ubuntu22.04_v1.0.0.tar.gz"

if [ ! -f "$FILE" ]; then
    echo "Image File $FILE not found. Downloading..."
    wget "$URL" -O "$FILE"
fi

docker load --input $FILE
IMAGE_ID=$(docker images | grep pc_tros | awk '{print $3}')
docker run -it --rm --name tros_cc_container --entrypoint="/bin/bash" --network=host -w /mnt/test -v ./cc_ws:/mnt/test "$IMAGE_ID"