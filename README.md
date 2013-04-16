CygwinSetting
========================================

Release Note
----------------------------------------

### x.x.x

### 1.2.0
- add setting of PS1 and window title
- add function to show contents of template
- make operation template addition function
- add sleep when edit existing operation

### 1.1.3
- change sl command option(@ alias)
- .gitignore to not commit swp files

### 1.1.2
- add sl command
-- set alias for sl command

### 1.1.1
- modify sakura and git settings
-- modify path of sakura editor
-- add global config for git

### 1.1.0
- hotfix for release tool(release.sh)
-- change directory resolution logic
-- to be able to release from directories except "tool/"

### 1.0.3
- modify searchlog function
-- remove unnecessary exit command
-- change directory structure
-- add operation option

### 1.0.2

- fit difference between other PC env.
-- modify programs path
-- add how to install git-flow and git-completion
-- add apt-cyg option(alias)
-- modify release.sh (change output method of setting path)

### 1.0.1

- modify gitk option
-- add --all when gitk was executed

### 1.0.0

- first version
- How to release
    cd tool/
    sh release.sh <setting name> <dir name for detail setting>
