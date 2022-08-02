# Git

## git log
To find a commit with blabla contained
$ git log -S blabla --oneline

## git work tree
* clone exemplo
$ git clone --bare Hiplatform@vs-ssh.visualstudio.com:v3/Hiplatform/DT/static-ticket static-ticket


### Add remote tracking
In the git config (simply repo/config in the case of a bare)

[remote "origin"]
  fetch = +refs/heads/*:refs/remotes/origin/*


* git worktree add [-f] [--detach] [--checkout] [--lock [--reason <string>]] [-b <new-branch>] <path> [<commit-ish>]
$ git worktree add -b emergency-fix ../temp master
$ pushd ../temp
... hack hack hack ...
$ git commit -a -m 'emergency fix for boss'
$ popd
$ git worktree remove ../temp

### List remote Git branches by author sorted by committer date:
git for-each-ref --format='%(committerdate) %09 %(authorname) %09 %(refname)' --sort=committerdate

