# golang-gpu-burn

## 오픈소스
This project uses code from [gpu-burn](https://github.com/wilicc/gpu-burn) which is licensed under the BSD-2-Clause license.

## Requirements
1. **Docker >= 20.0.0 (recommend)**
2. **nvidia driver**
   ```
   sudo apt-get install -y nvidia-driver-XXX (470 recommend)
   ```
3. **Cuda == 11.4.0**
4. **nvidia docker runtime**
   ```
   distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
   curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -
   curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list
   sudo apt-get update
   sudo apt-get install -y nvidia-docker2
   sudo systemctl restart docker

   ```

## 실행방법
1. `$ git clone https://github.com/jinsung-cho/golang-gpu-burn.git`
2. `$ cd golang-gpu-burn`
3. `$ sudo docker build -t my_gpu_burn_app .`
4. `$ sudo docker run --gpus all my_gpu_burn_app`




