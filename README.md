# SQLBULL

SQLBULL is a Docker-based SQL and DBMS fuzzing project. This repository contains fuzzing environments, generators, seed corpora, and helper scripts for:

- PostgreSQL
- MySQL
- MariaDB
- SQLite

## Repository layout

Each DBMS directory contains its Docker environment and setup scripts. PostgreSQL, MySQL, and MariaDB also include AFL-based fuzzing components; PostgreSQL includes a PostgreSQL 17.4 source snapshot used by its target environment.

```text
SQLBULL/
|-- PostgreSQL/
|-- MySQL/
|-- MariaDB/
|-- SQLite/
`-- doc/
```

## Quick start

Run the setup script for the target DBMS from a Linux environment with Docker and Bash available:

```bash
cd <DBMS>/scripts
bash setup_<dbms>.sh
```

For example:

```bash
cd PostgreSQL/scripts
bash setup_postgresql.sh
```

See [Installation and Run Instructions](doc/install_n_run_steps.md) for the container and fuzzing workflow.

## Documentation

- [Installation and Run Instructions](doc/install_n_run_steps.md)
- [Design document](doc/%E8%AE%BE%E8%AE%A1%E6%96%B9%E6%A1%88.md)

Third-party source trees and components retain their upstream notices and license files.
