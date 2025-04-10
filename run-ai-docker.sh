if [ ! -d "ai_toolchain_package" ]; then
  mkdir ai_toolchain_package
fi
if [ ! -d "data" ]; then
  mkdir data
fi

docker compose run --rm ai_toolchain_ubuntu_20_x5_gpu