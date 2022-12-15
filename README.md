# Lightweight Git Summary Script

This bash script can generate simple git reports for all git repositories


```
# Report Example
---------------some-small-project
     6  jackytsheng <jackytsheng@gmail.com>
     6  commits, 13  files changed, 307  insertions(+), 1  deletions(-)

---------------some-frontend-project
   177  jackytsheng <jackytsheng@gmail.com>
    54  Author A <authorA@163.com>
    53  jackytsheng <48374842+jackytsheng@users.noreply.github.com>
    35  Author B <authorB@163.com>
     9  unknown <xxxxx@gmail.com>
    17  Frank Yang <fyang@gmail.com>
   345  commits, 1937  files changed, 52137  insertions(+), 13493  deletions(-)
```

## How to use it ?

1. Clone this project repo or simply download the `git-summary.sh`
2. Move the script to the same directory level that consists all other repositories

```
# projects/

├── some-small-project (1st repo)
│   ├── README.md
│   └── src
├── some-frontend-project (2nd repo)
│   ├── README.md
│   └── src
└── git-summary.sh
```

## Report Limiting

You can provide optional flags to tailor the report. At the moment it supports specific git message for time frame and/or for specific author. If not specified, report will be printed out for all authors


```bash
# -s: since
./git-summary.sh -s "10 Jan 2022"


# Output
flag --since 01 Dec 2020 specified
---------------some-small-project
    31  jackytsheng <jackytsheng@gmail.com>
     1  jackytsheng <48374842+jackytsheng@users.noreply.github.com>
    32  commits, 140  files changed, 5196  insertions(+), 1330  deletions(-)

---------------some-frontend
     0  commits, 0  files changed, 0  insertions(+), 0  deletions(-)
```


```bash
# -b: before
./git-summary.sh -s "10 Dec 2021" -b "10 Jan 2022"


# Output
flag --since 01 Dec 2020 specified
---------------some-small-project
     0  commits, 0  files changed, 0  insertions(+), 0  deletions(-)

---------------some-frontend
   131  jackytsheng <jackytsheng@gmail.com>
    37  jackytsheng <48374842+jackytsheng@users.noreply.github.com>
    34   Frank Yang <fyang@gmail.com>
    31   unknown <xxxxx@gmail.com>
     2   Author B <authorB@163.com>
     1   jackytsheng <jackytsheng@gmail.com>
     1   Author A <authorA@163.com>
   237  commits, 1310  files changed, 17009  insertions(+), 9997  deletions(-)
```


```bash
# -a: author
./git-summary.sh -s "10 Dec 2021" -b "10 Dec 2022" -a Jacky


# Output
flag --since 01 Dec 2020 specified
---------------some-small-project
     0  commits, 0  files changed, 0  insertions(+), 0  deletions(-)

---------------some-frontend
   131  jackytsheng <jackytsheng@gmail.com>
    37  jackytsheng <48374842+jackytsheng@users.noreply.github.com>
   168  commits, 1143  files changed, 13515  insertions(+), 8879  deletions(-)
```

## Optional Flags Table

Under the hood, it uses `git log` to generate the report, so optional flag provided will be converted to flags that limit `git log`. See [Commit Limiting](https://git-scm.com/docs/git-log#_commit_limiting) for more detail

| optional flags | `git log` flags equivalent |
| -------------- | -------------------------- |
| -s             | --since                    |
| -b             | --before                   |
| -a             | --author                   |

## Footnote
If you find this useful please give a ⭐️. Much appreciate. Welcome any feedback or suggestion
