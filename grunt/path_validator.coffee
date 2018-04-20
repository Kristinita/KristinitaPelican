##########################
## grunt-path-validator ##
##########################
# Check, that space symbol not contains in any file or folder name:
# https://www.npmjs.com/package/grunt-path-validator
# Any file/folder naming convention not recommend space symbol in paths:
# https://superuser.com/q/29111/572069
# https://portal.slac.stanford.edu/sites/inc_public/Pages/folder-file-names.aspx
# https://www.reddit.com/r/linux/comments/1kpzxz/what_are_your_file_naming_conventions/
# https://www2.le.ac.uk/services/research-data/organise-data/naming-files
# https://library.stanford.edu/research/data-management-services/data-best-practices/best-practices-file-naming
# [NOTE] Plugin check folder names also, not only file names.
# If folder name contains space, grunt-path-validator show warning.
module.exports =
	spaces:
		src: ["<%= templates.paths.output_path %>/**/* *"]
