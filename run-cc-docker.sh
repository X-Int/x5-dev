# Cross compile docker image for TogetheROS
FILE="pc_tros_ubuntu22.04_v1.0.0.tar.gz"
URL="http://archive.d-robotics.cc/TogetheROS/cross_compile_docker/pc_tros_ubuntu22.04_v1.0.0.tar.gz"

if [ ! -f "$FILE" ]; then
    echo "Image File $FILE not found. Downloading..."
    curl -o "$FILE" "$URL"
fi

mkdir -p cc_ws/tros_ws/src

if [ ! -d "cc_ws/tros_ws/robot_dev_config" ]; then
    git clone https://github.com/D-Robotics/robot_dev_config.git -b develop ./cc_ws/tros_ws/robot_dev_config
    if command -v vcs-import >/dev/null 2>&1; then
        (cd cc_ws/tros_ws && vcs-import src  < ./robot_dev_config/ros2.repos)
    fi
fi

docker load --input $FILE
IMAGE_ID=$(docker images | grep pc_tros | awk '{print $3}')
docker run -it --rm --name tros_cc_container --entrypoint="/bin/bash" --network=host -w /mnt/test -v ./cc_ws:/mnt/test/cc_ws "$IMAGE_ID"
