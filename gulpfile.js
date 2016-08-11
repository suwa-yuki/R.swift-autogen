var gulp = require('gulp'),
    exec = require('child_process').exec;

var target = 'ResourceSample';

gulp.task('gen', function(cb) {
  exec(`./gen.sh ${target}`, function (err, stdout, stderr) {
    cb(err);
  });
});

gulp.task("watch", function() {
  var targets = [
    './**/*.storyboard',
    './**/*.xib',
    './**/*.json',
    './**/*.png'
  ];
  gulp.watch(targets, ['gen']);
});

