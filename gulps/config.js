module.exports = {
  paths: {
    html: {
      all: [
        'jade/**/*jade',
        '!jade/includes/**/*jade',
        '!jade/mixins/**/*jade'
      ],
      dest: './'
    },
    css: {
      all: './sass/**/*sass',
      dest: './styles'
    }
  }
};
