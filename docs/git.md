# Git

## git log
To find a commit with blabla contained
git log -S blabla --oneline

## git work tree
* clone exemplo
$ git clone --bare Hiplatform@vs-ssh.visualstudio.com:v3/Hiplatform/DT/static-ticket static-ticket

That is ta update from master
Only `git rebase master` will try see the local master not origin.
```bash
git rebase origin/master
```


### Add remote tracking
In the git config (simply repo/config in the case of a bare)

# option from Prime.
[remote "origin"]
  fetch = +refs/heads/*:refs/remotes/origin/*



Other option
 fecth = refs/heads/*:refs/heads/*

* git worktree add [-f] [--detach] [--checkout] [--lock [--reason <string>]] [-b <new-branch>] <path> [<commit-ish>]
$ git worktree add -b emergency-fix ../temp master
$ pushd ../temp
... hack hack hack ...
$ git commit -a -m 'emergency fix for boss'
$ popd
$ git worktree remove ../temp

### List remote Git branches by author sorted by committer date:
git for-each-ref --format='%(committerdate) %09 %(authorname) %09 %(refname)' --sort=committerdate

### To save a stash with a message:
git stash push -m "my_stash_name"

# To list stashes:
git stash list

# All the stashes are stored in a stack.
# To apply and remove the nth stash:
git stash pop stash@{n}

# To apply and remove a stash by name:
git stash pop stash^{/my_stash_name}

# To apply the nth stash:
git stash apply stash@{n}

# To apply a stash by name:
git stash apply stash^{/my_stash_name}

Switch remote to SSH (i.e .dotfiles)
=====================================================
```bash
git remote rm origin
git remote add origin git@github.com:maracunha/.dotfiles.git
```

Remove o file that was first then create a .gitignore
=====================================================
```bash
git reset name_of_file
```
If already pushed, need to delete then push to origin
```bash
git rm --cached name_of_file
```

