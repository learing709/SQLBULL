# Installation and Run Instructions

To run specific DBMS fuzzing: 

```bash
cd <DBMS_name>/scripts
bash setup_<DBMS_name>.sh
sudo docker run -d --name sqlbull_pg -it --user postgresql --memory="10g" --memory-swap="10g" sqlbull_<DBMS_name>   tail -f /dev/null
sudo docker exec -it sqlbull_pg bash
---
sudo docker run -it --user root --memory="10g" --memory-swap="10g" sqlbull_<DBMS_name> /bin/bash
cat /proc/sys/kernel/core_pattern        
|/usr/share/apport/apport -p%p -s%s -c%c -d%d -P%P -u%u -g%g -- %E
echo core > /proc/sys/kernel/core_pattern
无权限
sudo docker run \
  --privileged \
  -d \
  --user root \
  --memory="10g" \
  --memory-swap="10g" \
  --name sqlbull_fuzz \
  sqlbull_postgresql \
  tail -f /dev/null
sudo docker exec -it sqlbull_fuzz bash
su - postgresql
cd /home/postgresql/sqlbull_postgresql/scripts
tmux new -s fuzz

# Inside the container. 


python3 run_parallel.py -c <CPU_CORE_START_ID> -n <NUM_OF_CONCURRENT_RUN>.
python3 run_parallel.py -c 0 

Ctrl + b
然后按 d
```
tmux ls
postgresql_server_debug: 3 windows 
tmux list-windows -t postgresql_server_debug
0: bash (1 panes) [80x24] [layout b25d,80x24,0,0,0] @0
1: fuzzing_test_0- (1 panes) [80x24] [layout b25e,80x24,0,0,1] @1
2: postgresql_test_0* (1 panes) [80x24] [layout b25f,80x24,0,0,2] @2 (active)