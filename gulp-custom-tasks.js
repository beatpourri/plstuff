/* globals require */
// eslint-disable-next-line strict
'use strict';

// General
var gulp = require('gulp-help')(require('gulp'));
var localConfig = {};

try {
    localConfig = require('./local.gulp-config');
}
catch (e) {
    if (e.code !== 'MODULE_NOT_FOUND') {
        throw e;
    }
}

/* Custom tasks */

// Get all svg files and add it to a icons.json --  (see: 01-atoms/04-images/icons/)
var listfiles = require('gulp-listfiles');
var options = {
    filename: 'icons.json',
    replacements: [{
        pattern: '.svg',
        replacement: '',
    }, {
        pattern: /(file)(_)([\S]*?)(_)(test)/gi,
        replacement: function (match, p1, p2, p3, p4, p5, offset, string) {
            return [p1, p3, p5].join('-');
        }
    }],
    banner:
        '{\n' +
        '\t"items": [',
    footer: '\t]\n' +
        '}',
    eol: 'crlf',
    prefix: '\t\t{\n\t\t\t"value": "',
    postfix: '"\n\t\t}, ',
    postfixLastLine: '"\n\t\t}'
};

gulp.task('listallicons', function () {
    return gulp.src(['images/icons/src/**/*.svg'], {read: false})
        .pipe(listfiles(options))
        .pipe(gulp.dest('components/_patterns/01-atoms/04-images/icons'));
});
//

// Watch custom tasks
gulp.task('customtasks', function() {
    // Watch .svg icon files
    gulp.watch('images/icons/src/**/*.svg', ['listallicons', 'icons']);
});
