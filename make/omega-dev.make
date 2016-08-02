api = 2
core = 7.x

projects[omega][type] = theme
projects[omega][version] = 4.4
projects[omega][patch][2453475] = https://www.drupal.org/files/issues/omega-2453475-panels-headings-1.patch

libraries[selectivizr][download][type] = "file"
libraries[selectivizr][download][url] = "https://github.com/fubhy/selectivizr/archive/master.zip"

libraries[html5shiv][download][type] = "file"
libraries[html5shiv][download][url] = "https://github.com/fubhy/html5shiv/archive/master.zip"

; Avoid if possible to use this library, that may cause performance issues.
;libraries[respond][download][type] = "file"
;libraries[respond][download][url] = "https://github.com/fubhy/respond/archive/master.zip"

libraries[matchmedia][download][type] = "file"
libraries[matchmedia][download][url] = "https://github.com/fubhy/matchmedia/archive/master.zip"

libraries[pie][download][type] = "file"
libraries[pie][download][url] = "https://github.com/fubhy/pie/archive/master.zip"
