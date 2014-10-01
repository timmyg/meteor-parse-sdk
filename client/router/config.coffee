Router.configure
  layoutTemplate: 'layout'
  loadingTemplate: 'loading'
  yieldTemplates:
    header:
      to: 'header'
    footer:
      to: 'footer'
  onBeforeAction: ->
    $('meta[name^="description"]').remove()
    $('html').css('display', 'none')
  onAfterAction: ->
    TRANSITION_TYPE = 'fadeIn'
    TRANSITION_DURATION = 1000
    $('html').velocity( TRANSITION_TYPE, TRANSITION_DURATION )


Template.rendered ->
  console.log "rendered"
  if Router.current() and Router.current().route.name is "landing"
      $('nav').addClass "hide"
      $('.page-top-spacing').addClass "hide"
  else
      $('nav').removeClass "hide"
      $('.page-top-spacing').removeClass "hide"