"use strict";

var gulp = require('gulp');

var terser = require('gulp-terser');
var sass = require('gulp-sass');
var flatten = require('gulp-flatten');
var spawn = require('child_process').spawn;
var browsersync = require('browser-sync').create();

sass.compiler = require('node-sass');

function styles(done) {
    return gulp.src(['src/sass/screen.scss'])
    .pipe(sass().on('error', sass.logError))
    .pipe(gulp.dest('static/css/'))
    .pipe(browsersync.stream());
}

function scripts() {
    return gulp.src(['node_modules/@fortawesome/fontawesome-free/js/all.js'])
    .pipe(flatten())
    .pipe(terser())
    .pipe(gulp.dest('static/js/'))
    .pipe(browsersync.stream());
}

function browserSync(done) {
  spawn('hugo', ['serve', '-w', '-D'], {stdio: 'inherit'});
  browsersync.init({
    port: 1314,
    proxy: 'localhost:1313'
  });
  done();
}

function browserSyncReload(done) {
  browsersync.reload();
  done();
}

function watchFiles() {
  gulp.watch("src/sass/*.scss", styles);
  //gulp.watch("src/js/*.js", scripts);
  //handled by HUGO
    //gulp.watch(['*.html'], browserSyncReload);
}

exports.build = gulp.parallel(styles, scripts);
exports.watch = gulp.parallel(watchFiles, browserSync);
