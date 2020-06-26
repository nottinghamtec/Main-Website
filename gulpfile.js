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
    return gulp.src(['src/sass/screen.scss'])
    .pipe(sass().on('error', sass.logError))
    .pipe(postcss([ autoprefixer() ]))
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

function watchFiles() {
  gulp.watch("src/sass/*.scss", styles);
}

exports.build = gulp.parallel(styles, scripts);
exports.watch = gulp.parallel(watchFiles, spawn('hugo', ['serve', '-w', '-D'], {stdio: 'inherit'}));
