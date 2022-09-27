#########################
## grunt-contrib-clean ##
#########################
###
[OVERVIEW] Delete blank folders and non-needed files
https://www.npmjs.com/package/grunt-contrib-clean

[INFO] Options:
https://www.npmjs.com/package/grunt-contrib-clean#options
###
module.exports =
	[
		# [DEPRECATED] I migrate from grunt-move to Pelican method:
		# http://docs.getpelican.com/en/latest/tips.html#copy-static-files-to-the-root-of-your-site
		# "<%= templates.yamlconfig.OUTPUT_PATH %>/extra"
		# [INFO] Stylus templates files generate sections, but themselves shouldn't be compiled:

		# [INFO] General:
		"<%= templates.yamlconfig.OUTPUT_PATH %>/<%= templates.yamlconfig.THEME_STATIC_DIR %>/css\
		/nelican-themes/nelican-themes-core-design.css"
		"<%= templates.yamlconfig.OUTPUT_PATH %>/<%= templates.yamlconfig.THEME_STATIC_DIR %>/components\
		/placeholders.css"

		# [INFO] Pygments
		"<%= templates.yamlconfig.OUTPUT_PATH %>/<%= templates.yamlconfig.THEME_STATIC_DIR %>/css\
		/nelican-themes-third-party/Pygments/pygments-core.css"

		# [INFO] ProgressBar
		"<%= templates.yamlconfig.OUTPUT_PATH %>/<%= templates.yamlconfig.THEME_STATIC_DIR %>/css\
		/nelican-themes-third-party/ProgressBar/progressbar-core.css"


		# [DECLINED] I no longer use Tooltipster
		# [INFO] Tooltipster
		# "<%= templates.yamlconfig.OUTPUT_PATH %>/<%= templates.yamlconfig.THEME_STATIC_DIR %>/css\
		# /nelican-themes-third-party/Tooltipster/tooltipster-core.css"


		# [DEPRECATED] Wildfire no longer functioning more
		# [INFO] Wildfire
		# "<%= templates.yamlconfig.OUTPUT_PATH %>/<%= templates.yamlconfig.THEME_STATIC_DIR %>/css\
		# /nelican-themes-third-party/wildfire.css"
	]
