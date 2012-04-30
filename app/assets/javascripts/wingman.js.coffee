#= require jquery

$ -> $( '.notice, .alert' ).on 'click', -> $( @ ).fadeOut 'slow'
