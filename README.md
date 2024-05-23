# vesc-1107
VESC-1107

## Bring up a cluster using 3.12

```
make DOCKER_FRESH=true RABBITMQ_DOCKER_TAG='rabbitmq:3.12-management' up
```

## Validate 3.12

* Open management UI
* Note the quorum queues

## Upgrade cluster to 3.13

* First, re-build images using `rabbitmq:3-management` image:
    ```
    make DOCKER_FRESH=true RABBITMQ_DOCKER_TAG='rabbitmq:3-management' build
    ```
* Then, upgrade. This will cause PerfTest to re-connect as well:
    ```
    ./upgrade.sh
    ```

## Validate 3.13
* Open management UI
* Refresh, if necessary, to verify upgraded version
* Note the quorum queues
* Note that perf test is still running fine
