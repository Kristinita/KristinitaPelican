#########################
## grunt-contrib-clean ##
#########################
# Delete blank folders and non-needed files
# https://www.npmjs.com/package/grunt-contrib-clean
# Options:
# https://www.npmjs.com/package/grunt-contrib-clean#options
module.exports =
	[
		# [DEPRECATED] I migrate from grunt-move to Pelican method:
		# http://docs.getpelican.com/en/latest/tips.html#copy-static-files-to-the-root-of-your-site
		# "<%= templates.yamlconfig.OUTPUT_PATH %>/extra"
		# [INFO] Stylus templates files generate sections, but themselves shouldn't be compiled:
		# [INFO] General:
		"<%= templates.yamlconfig.OUTPUT_PATH %>/<%= templates.yamlconfig.THEME_STATIC_DIR %>/css/sections/core-design.css"
		"<%= templates.yamlconfig.OUTPUT_PATH %>/<%= templates.yamlconfig.THEME_STATIC_DIR %>/css/general/placeholders.css"
		# [INFO] Pygments
		"<%= templates.yamlconfig.OUTPUT_PATH %>/<%= templates.yamlconfig.THEME_STATIC_DIR %>/css\
		/script-colors/Pygments/pygments-core.css"
		"<%= templates.yamlconfig.OUTPUT_PATH %>/<%= templates.yamlconfig.THEME_STATIC_DIR %>/css\
		/script-colors/Pygments/pygments-paraiso-light.css"
		# [INFO] Tooltipster
		"<%= templates.yamlconfig.OUTPUT_PATH %>/<%= templates.yamlconfig.THEME_STATIC_DIR %>/css\
		/script-colors/Tooltipster/tooltipster-core.css"
		# [INFO] Wildfire
		"<%= templates.yamlconfig.OUTPUT_PATH %>/<%= templates.yamlconfig.THEME_STATIC_DIR %>/css\
		/sections/wildfire.css"
	]
