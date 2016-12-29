# docker.shell
Shell script to maintain docker containers

## bin/cmd.sh
up, down, pull container
	
## bin/up container -d
```
bin/up mosca -d
```

## bin/down container
```
bin/down mosca
```

## bin/pull container
```
bin/pull mosca
```

## bin/clean
rm exited containers, unused images, orphaned docker volumes
```
bin/clean
```

## bin/docker-compose
start container to run docker compose ui and it is equivalent to 'bin/up composeui'
```
bin/docker-compose -f composeui/docker-compose.yml up
```
