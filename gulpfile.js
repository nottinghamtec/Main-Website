"use strict";

var gulp = require('gulp');

var autoprefixer = require('autoprefixer')
var terser = require('gulp-terser');
var sass = require('gulp-sass');
var postcss = require('gulp-postcss')
var flatten = require('gulp-flatten');
var spawn = require('child_process').spawn;

sass.compiler = require('node-sass');

function styles(done) {
    return gulp.src(['src/sass/screen.scss',
                    'src/sass/screen-async.scss'])
    .pipe(sass().on('error', sass.logError))
    .pipe(postcss([ autoprefixer() ]))
    .pipe(gulp.dest('static/css/'))
    .on('end', done);
}

function scripts(done) {
    return gulp.src(['node_modules/@fortawesome/fontawesome-free/js/all.js',
                     'node_modules/materialize-css/dist/js/materialize.min.js'])
    .pipe(flatten())
    .pipe(terser())
    .pipe(gulp.dest('static/js/'))
    .on('end', done);
}

function up(done) {
    spawn('hugo', ['serve', '-w', '-D'], {stdio: 'inherit'});
    done();
}

function watchFiles(done) {
  gulp.watch("src/sass/*.scss", styles);
  done();
}

exports.build = gulp.parallel(styles, scripts);
exports.watch = gulp.parallel(watchFiles, up);
