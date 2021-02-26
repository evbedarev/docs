## Start infinite loop in pod
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: ubuntu
spec:
  containers:
  - name: ubuntu
    image: ubuntu:latest
    # Just spin & wait forever
    command: [ "/bin/bash", "-c", "--" ]
    args: [ "while true; do sleep 30; done;" ]
```

## Sleep command
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: busybox
  labels:
    app: busybox
spec:
  containers:
  - name: busybox
    image: busybox
    ports:
    - containerPort: 80
    command: ["/bin/sh", "-ec", "sleep 1000"]
  nodeSelector:
    beta.kubernetes.io/os: linux
```
#Docker
1. In your Dockerfile use this command:
```bash
CMD ["sh", "-c", "tail -f /dev/null"]
```
2. Build your docker image.
3. Push it to your cluster or similar, just to make sure the image it's available.
```bash
kubectl run debug-container -it --image=<your-image>
```
