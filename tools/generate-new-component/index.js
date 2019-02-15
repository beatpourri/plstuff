'use strict';

var yeoman = require('yeoman-generator');
var includes = require('lodash.includes');
var path = require('path');
var fs = require('fs');
var chalk = require('chalk');
var plBase = ('./components/_patterns');

module.exports = yeoman.Base.extend({
  prompting: function () {
    console.log(chalk.bold.blue('Add a new component'));
    var prompts = [{
      type: 'list',
      name: 'patternType',
      message: 'Where do you want to add the new component?',
      // Filter files in folders
      choices: fs.readdirSync(plBase, 'utf8').filter(function(listfolders) {
        return listfolders !== '.DS_Store' && listfolders !== 'style.scss';
      })

    }, {
      type: 'list',
      name: 'patternSubType',
      message: 'Where in here?',
      choices: function(answers) {
        var folder = path.join(plBase, answers.patternType);
        // Filter files in subfolders
        var subfolders = fs.readdirSync(folder, 'utf8').filter(function(listsubfolders) {
          return listsubfolders !== '.DS_Store'
        });
        return ['./'].concat(subfolders);
      }
    }, {
      type: 'checkbox',
      name: 'files',
      message: 'What files should be saved?',
      choices: [
        'twig',
        'scss',
        'yml',
        'md',
        'js'
      ],
      default: [
        'twig',
        'yml',
        'scss',
        'md',
        'js'
      ]
    }, {
      name: 'name',
      message: 'What name should the new component have? ',
      filter: function(answer) {
        return answer.replace(/ /g, '-').toLowerCase();
      }
    }];

    return this.prompt(prompts).then(function (props) {
      // To access props later use this.props.someAnswer;
      this.props = props;
    }.bind(this));
  },

  writing: function () {
    // console.log(this.props);
    var destPath = path.join(plBase, this.props.patternType, this.props.patternSubType, this.props.name);

    if (includes(this.props.files, 'scss')) {
      this.fs.copyTpl(
        this.templatePath('_pattern.scss'),
        this.destinationPath(path.join(destPath, '_' + this.props.name + '.scss')),
        this.props
      );
    }

    if (includes(this.props.files, 'twig')) {
      this.fs.copyTpl(
        this.templatePath('pattern.twig'),
        this.destinationPath(path.join(destPath, this.props.name + '.twig')),
        this.props
      );
    }

    if (includes(this.props.files, 'yml')) {
      this.fs.copyTpl(
        this.templatePath('pattern.yml'),
        this.destinationPath(path.join(destPath, this.props.name + '.yml')),
        this.props
      );
    }

    if (includes(this.props.files, 'js')) {
      this.fs.copyTpl(
        this.templatePath('pattern.js'),
        this.destinationPath(path.join(destPath, this.props.name + '.js')),
        this.props
      );
    }

    if (includes(this.props.files, 'md')) {
      this.fs.copyTpl(
        this.templatePath('pattern.md'),
        this.destinationPath(path.join(destPath, this.props.name + '.md')),
        this.props
      );
    }
  }
  
});
