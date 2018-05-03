########################
## grunt-git-them-all ##
########################
# Run any Git command from Grunt:
# https://www.npmjs.com/package/grunt-git-them-all
# [NOTE] I don't find any Grunt plugin, that can set environment variables cross-platform;
# you need to use platform-specific syntax for set SASHASHORTCOMMITDESCRIPTION and
# SASHALONGCOMMITDESCRIPTION variables.
# [WARNING] npm WARN in console:
# https://github.com/ZuBB/grunt-git-them-all/pull/2
module.exports =
	options:
		stdout: true
		stderr: true
	# git add -A
	# https://stackoverflow.com/a/572660/5951529
	add:
		command: 'add -A'
	# Multiline commit:
	# https://stackoverflow.com/a/5070502/5951529
	commit:
		# SET — command for temporary change variable in current session:
		# https://superuser.com/a/976956/572069
		# First configure your SASHASHORTCOMMITDESCRIPTION and SASHALONGCOMMITDESCRIPTION variables:
		# SET SASHASHORTCOMMITDESCRIPTION=<your short commit description>
		# SET SASHALONGCOMMITDESCRIPTION=<your long commit description>
		# [NOTE] Needs “is” instead of “==”
		if process.platform is "win32"
			command: 'commit -m "%SASHASHORTCOMMITDESCRIPTION%" -m "%SASHALONGCOMMITDESCRIPTION%"'
		# Set variable only for current shell:
		# https://askubuntu.com/a/58828/582218
		# First configure your SASHASHORTCOMMITDESCRIPTION and SASHALONGCOMMITDESCRIPTION variables:
		# SASHASHORTCOMMITDESCRIPTION="<your short commit description>"
		# SASHALONGCOMMITDESCRIPTION="<your long commit description>"
		else
			command: 'commit -m "$SASHASHORTCOMMITDESCRIPTION" -m "$SASHALONGCOMMITDESCRIPTION"'
	push:
		command: 'push'
