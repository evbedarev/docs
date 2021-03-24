- When pvc/pv in status Terminating
```bash
kubectl patch pvc storage-pvc -p '{"metadata":{"finalizers": []}}' --type=merge
```
