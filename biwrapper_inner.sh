#! /usr/bin/env sh
#

workdir=$(cd "$(dirname $0)" && pwd)
cd "$workdir"

# 1. query data from database
# su - no-reply -c "cd ${workdir}; ./biquery.sh"
su - root -c "cd ${workdir}; source venv/bin/activate; ./biquery.py"

# 2. send to mail
# su - no-reply -c "cd ${workdir}; ./bisendmail.sh"
su - root -c "cd ${workdir}; ./bisendmail.sh"
