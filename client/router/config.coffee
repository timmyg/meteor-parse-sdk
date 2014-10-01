Router.configure
  layoutTemplate: 'layout'
  loadingTemplate: 'loading'
  yieldTemplates:
    header:
      to: 'header'
    footer:
      to: 'footer'
  action: ->
  	console.log "action"
  onBeforeAction: ->
    $('meta[name^="description"]').remove()
    $('html').css('display', 'none')
  onAfterAction: ->
    TRANSITION_TYPE = 'fadeIn'
    TRANSITION_DURATION = 1000
    $('html').velocity( TRANSITION_TYPE, TRANSITION_DURATION )
