- Cначала надо создать Gateway. В app: указываю  метку истио оператора, egress. Указываем порт больше 10000 и какой протокол будем использовать.
```bash
apiVersion: networking.istio.io/v1alpha3
kind: Gateway
metadata:
  name: egress-dogma-infra-gw-tcp
  namespace: ci02261718-edevgen-dgm-infra-dev2
spec:
  selector:
    app: egress-dogma-infra
  servers:
    - hosts:
        - '*'
      port:
        name: tcp-egress
        number: 11587
        protocol: TCP

```
- Потом создаю сервис который будет направлять трафик на gateway по новому порту.

```bash
kind: Service
apiVersion: v1
metadata:
  name: egress-dogma-infra-tcp-svc
  namespace: ci02261718-edevgen-dgm-infra-dev2
  labels:
    app: egress-dogma-infra
spec:
  ports:
    - name: tcp-egress
      protocol: TCP
      port: 11587
      targetPort: 11587
  selector:
    app: egress-dogma-infra
  type: ClusterIP
```

- Cоздаем ServiceEntry, что бы трафик из пода по днс имени направлялся на мэш.

```bash
apiVersion: networking.istio.io/v1alpha3
kind: ServiceEntry
metadata:
  name: mail-subset
  namespace: ci02261718-edevgen-dgm-infra-dev2
spec:
  hosts:
    - smtpAS.sigma.sbrf.ru
  ports:
    - name: tcp
      number: 587
      protocol: TCP
  resolution: DNS
```
- Создаем DestinationRule который создает дополнительные правила назначения(типа балансировки, отбора и тд)
```yaml
apiVersion: networking.istio.io/v1alpha3
kind: DestinationRule
metadata:
  name: egressgateway-for-email-server
  namespace: ci02261718-edevgen-dgm-infra-dev2
spec:
  exportTo:
    - .
  host: >-
    egress-dogma-infra-tcp-svc.ci02261718-edevgen-dgm-infra-dev2.svc.cluster.local
  subsets:
    - name: mail-subset
```
- Создаем VirtualService, который будет говорить егресу какой трафик забирать с мэша и куда его потом отправлять.

```yaml
apiVersion: networking.istio.io/v1alpha3
kind: VirtualService
metadata:
  name: direct-mail-through-egress-gateway
  namespace: ci02261718-edevgen-dgm-infra-dev2
spec:
  exportTo:
    - .
  gateways:
    - mesh
    - egress-dogma-infra-gw-tcp
  hosts:
    - smtpAS.sigma.sbrf.ru
  tcp:
    - match:
        - gateways:
            - mesh
          port: 587
      route:
        - destination:
            host: >-
              egress-dogma-infra-tcp-svc.ci02261718-edevgen-dgm-infra-dev2.svc.cluster.local
            port:
              number: 11587
            subset: mail-subset
          weight: 100
    - match:
        - gateways:
            - egress-dogma-infra-gw-tcp
          port: 11587
      route:
        - destination:
            host: smtpAS.sigma.sbrf.ru
            port:
              number: 587
          weight: 100
```
