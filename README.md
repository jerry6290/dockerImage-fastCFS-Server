# dockerImage-fastCFS-Server

### 启动方式：

```
docker run --name=fastCFS  --privileged -d jerry6290/fastcfs:v3.1.0
```

v3.1.0是版本号，可以根据实际情况修改成最新版本号。

注意：由于需要通过fuse把FastCFS作为目录挂载，所以在docker run时需要增加参数 **--privileged**，让容器真正有root权限。

### 登录到容器验证fastCFS

  ```
docker exec -it fastCFS sh

# 执行 df -h ，应该能看到 fastCFS的fs pool 被挂载到 /opt/fastcfs/fuse 目录
df -h
Filesystem               Size  Used Avail Use% Mounted on
overlay                  500G  110G  391G  22% /
tmpfs                     64M     0   64M   0% /dev
tmpfs                     12G     0   12G   0% /sys/fs/cgroup
shm                       64M     0   64M   0% /dev/shm
/dev/mapper/centos-root  500G  110G  391G  22% /etc/hosts
/dev/fuse                342G     0  342G   0% /opt/fastcfs/fuse

# 写文件
echo 'Hello FastCFS' > /opt/fastcfs/fuse/FastCFS.txt

# 查看文件内容
cat /opt/fastcfs/fuse/FastCFS.txt
Hello FastCFS

```

该Dockerfile开源在github，并通过github Actions自动打包并push到docker hub，项目地址：https://github.com/jerry6290/dockerImage-fastCFS-Server
