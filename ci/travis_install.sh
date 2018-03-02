# Parallel npm and pip tasks:
# https://unix.stackexchange.com/a/427419/237999
# [WARNING] Default UNIX parallel commands doesn't work for Travis CI:
# https://unix.stackexchange.com/questions/427410#comment771128_427415
# [NOTE] Grunt tasks needs grunt-cli globally:
# https://stackoverflow.com/a/21133609/5951529
parallel ::: 'pip install --upgrade pip && pip install pipenv && pipenv install --dev' \
             'npm install --global npm && npm install -g grunt-cli && npm install'
