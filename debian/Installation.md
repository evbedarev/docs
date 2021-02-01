# Install Debian
1. [Install amd drivers](#amd)
2. [Install docker](#docker)
3. [Install kubectl](#kubectl)
4. [Install vbox](#vbox)
5. [Install minikube](#minikube)

## Install amd drivers on Debian 10<a name="amd"></a>
- Use your favorite text editor to open /etc/apt/sources.list. Modify each line to add the contrib and non-free repositories. The end result should look like the example below. 
```bash
deb http://deb.debian.org/debian/ buster main non-free contrib
deb-src http://deb.debian.org/debian/ buster main non-free contrib

deb http://security.debian.org/debian-security buster/updates main contrib non-free
deb-src http://security.debian.org/debian-security buster/updates main contrib non-free
```
- Save and exit. Then, update Apt.
```bash
apt update
```
- Now, you can install the non-free Linux firmware from the Debian repository. In addition to that, it's a good idea to install several other key Mesa packages to ensure that your system has everything that it needs.
```bash
apt install firmware-linux firmware-linux-nonfree libdrm-amdgpu1 xserver-xorg-video-amdgpu
```
### How to Install Vulkan
- Vulkan support isn't strictly necessary, but with the widening support that its receiving in the gaming world, it can't hurt to have, and the performance improvements it promises are substantial enough to make it worth using whenever possible. Actually, Wine and Lutris are relying on Vulkan more and more to increase compatibility and performance on a wide range of games. Install Vulkan support with the following.
```bash
# apt install mesa-vulkan-drivers libvulkan1 vulkan-tools vulkan-utils vulkan-validationlayers
```
### How to Install OpenCL
- If you plan on using OpenCL with your AMD card too, you should include support for it. Now, this support through Mesa isn't the same as professional grade support. If that's what you need, consider an officially supported distribution like Ubuntu. However, if you're just using it for basic tasks, the Mesa support will suffice.
```bash
# apt install mesa-opencl-icd
```

# Install Docker <a name="docker"></a>
1. Update the apt package index and install packages to allow apt to use a repository over HTTPS:
```bash
$ sudo apt-get update

$ sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
```
2. Add Docker’s official GPG key:
```bash
$ curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
```
3. Use the following command to set up the stable repository. To add the nightly or test repository, add the word nightly or test (or both) after the word stable in the commands below. Learn about nightly and test channels.

```bash
$ sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"
```
4. Update the apt package index, and install the latest version of Docker Engine and containerd, or go to the next step to install a specific version:

```bash
$ sudo apt-get update
$ sudo apt-get install docker-ce docker-ce-cli containerd.io
```
# Install kubectl <a name="kubectl"></a>
1. Download the latest release with the command:

```bash
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
```
2. Install kubectl

```bash
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
```
# Install vbox <a name="vbox"></a>
1. Add virtualbox.list to /etc/apt/sources.list.d

```bash
deb http://download.virtualbox.org/virtualbox/debian buster contrib
```
2. Add Oracle VirtualBox public key: 
```bash
wget https://www.virtualbox.org/download/oracle_vbox_2016.asc
sudo apt-key add oracle_vbox_2016.asc
```
3. Install virtualbox-6.1 

```bash
sudo apt-get update
sudo apt-get install virtualbox-6.1
```
# Install minikube <a name="minikube"></a>
1. Вы также можете загрузить двоичный файл и использовать его вместо установки пакета:
```bash
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 \
  && chmod +x minikube
```
- Чтобы исполняемый файл Minikube был доступен из любой директории выполните следующие команды:

```bash
sudo mkdir -p /usr/local/bin/
sudo install minikube /usr/local/bin/
```

2. Запускаем 
```bash
minikube start
```
