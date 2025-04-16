# x5-dev
Scripts to quickly setup RDK X5 cross-compilation environment for TogetherROS and AI Toolchain

## Cross-Compilation Instructions
1. Cross compilation. This step is completed in the docker environment

```bash
## Navigate to the build path
cd /mnt/test/cc_ws/tros_ws

## Compile using build.sh script, specify the platform to compile for using the -p option [X3|X5|X86]
## For example, to compile TROS for X3 platform, execute the following command
bash robot_dev_config/build.sh -p X3
## to compile TROS for X5 platform, execute the following command
bash robot_dev_config/build.sh -p X5
```