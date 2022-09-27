######################
## grunt-dev-update ##
######################
###
[OVERVIEW] Automatic update local dev dependencies:
https://www.npmjs.com/package/grunt-dev-update
https://stackoverflow.com/a/48952098/5951529

[INFO] Options:
https://www.npmjs.com/package/grunt-dev-update#options

[WARNING] I don’t know a grunt-dev-update replacement for pnpm.
https://github.com/pnpm/pnpm/issues/4630#issuecomment-1252323717
“reportOnlyPkgs” is critical option, so I keep using npm and not pnpm

[BUG][NOTE] npm-check + pnpm also fail to update all dependencies except some:
https://github.com/dylang/npm-check/issues/468
###
module.exports =
	main:
		options:
			###
			[INFO] Automatically  force the update for the outdated packages:
			https://www.npmjs.com/package/grunt-dev-update#optionsupdatetype
			###
			updateType: "force"

			###
			[INFO] “Packages will be updated to the latest version there is,
			regardless of your package.json specifications.”
			https://www.npmjs.com/package/grunt-dev-update#optionssemver
			###
			semver: false

			###
			[INFO] List of packages that shouldn’t be updated:
			https://www.npmjs.com/package/grunt-dev-update#optionsreportonlypkgs

			I include packages with bugs in the latest versions,
			but worked in previous versions.


			[BUG] imagemin-webp 7.0.0 doesn’t work:
			https://github.com/imagemin/imagemin/issues/392
			https://github.com/imagemin/imagemin-webp/issues/41
			I downgraded to imagemin-webp 6.0.0

			###
			reportOnlyPkgs: ["imagemin-webp"]
