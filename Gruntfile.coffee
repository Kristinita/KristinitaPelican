# @Author: Kristinita
# @Date:   2017-04-05 20:11:18
# @Last Modified time: 2017-04-11 08:20:09

module.exports = (grunt) ->
  grunt.loadNpmTasks 'grunt-shell'
  grunt.loadNpmTasks 'grunt-move'
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-text-replace'
  grunt.loadNpmTasks 'grunt-postcss'
  grunt.loadNpmTasks 'grunt-jsbeautifier'
  grunt.loadNpmTasks 'grunt-contrib-imagemin'
  grunt.loadNpmTasks 'grunt-image'
  grunt.initConfig
  	###################
  	## Pelican build ##
  	###################
  	## http://manos.im/blog/static-site-pelican-grunt-travis-github-pages/
  	## https://github.com/sindresorhus/grunt-shell
    shell:
      generate: command: 'pelican content -s pelicanconf.py'
      deploy: command: 'pelican content -s publishconf.py'
    ##################################
    ## Move files to another folder ##
    ##################################
    ## https://www.npmjs.com/package/grunt-move
    move:
      options:
        ignoreMissing: true
        moveAcrossVolumes: true
      ## Favicons
      favicons:
        src: 'output/favicons/*'
        dest: 'output/'
      ## HTML, which I need to move in root folder
      roothtml:
        src: 'output/root-html/*'
        dest: 'output/'
      ## Different file types
      extra:
        src: 'output/extra/*'
        dest: 'output/'
    ##########################
    ## Delete blank folders ##
    ##########################
    ## https://github.com/gruntjs/grunt-contrib-clean
    clean: [
      'output/extra'
      'output/favicons'
      'output/root-html'
    ]
    ##################
    ## Replace text ##
    ##################
    ## https://github.com/yoniholmes/grunt-text-replace
    replace: replacehtml:
      src: [ 'output/**/*.html' ]
      overwrite: true
      replacements: [
      	## Incorrect paths for personal CSS and JavaScript,
      	## https://github.com/mortada/pelican_javascript/issues/3
        {
          from: 'css/personal'
          to: '../css/personal'
        }
        ## Fancybox images,
        ## With regex: https://github.com/yoniholmes/grunt-text-replace#usage
        {
          from: /<img alt="([A-Za-z0-9А-ЯЁёа-я ]+)" src="(.+?)"( \/)?>/g
          to: '<a class="fancybox" href="$2"><img src="$2" alt="$1"></a>'
        }
        ## Cllipboard.js,
        ## http://ru.stackoverflow.com/a/582520/199934
        ## http://stackoverflow.com/a/33758293/5951529
        {
          from: /<pre><code class="(.+?)">((.|\n|\r)+?)<\/code><\/pre>/g
          to: '<pre><code data-language="$1">$2</code><button class="SashaButton SashaTooltip"><img src="../images/interface_images/clippy.svg" alt="Clipboard button" width="13"></button></pre>'
        }
      ]
    ##########################
    ## PostCSS Autoprefixer ##
    ##########################
    # https://github.com/nDmitry/grunt-postcss
    postcss: {
      options: {
        map: true,
        processors: [
          require('autoprefixer')()
        ]
      },
      dist: {
        src: [ 'themes/sashapelican/static/css/**/*.css', 'content/personal/**/*.css' ]
      }
    }
    ###################
    ## js-beautifier ##
    ###################
    ## https://github.com/vkadam/grunt-jsbeautifier
    jsbeautifier:
    	files: [ 'output/**/*.html' ]

   	image:
   	    static:
   	      options:
	          pngquant: true,
	          optipng: true,
	          zopflipng: true,
	          jpegRecompress: true,
	          jpegoptim: true,
	          mozjpeg: true,
	          gifsicle: true,
	          svgo: true
   	      files:
   	      	src: ['output/**/*.jpg']
    # # Imagemin
    # ##
    # imagemin:
    # 	static:  {
	   #    dist: {
	   #      src: ['output/**/*.{png,jpg,jpeg,gif,svg}'],
	   #    }
	   #  }

  grunt.registerTask 'test', [
  	'postcss'
    'shell:generate'
    'move'
    'clean'
    'replace'
  ]
  grunt.registerTask 'build', [
    'shell:generate'
    'move'
    'clean'
    'replace'
  ]
  grunt.registerTask 'publish', [
  	'postcss'
    'shell:deploy'
    'move'
    'clean'
    'jsbeautifier'
    'replace'
  ]
  return
