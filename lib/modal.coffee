
@DEBUG = false

@t9nIt = (string) ->
  T9n?.get?(string) or string

Template.registerHelper 'mmT9nit', (string) ->
  t9nIt(string)

MaterializeModal = new MaterializeModalClass()

Template.materializeModal.onCreated ->
  console.log("materializeModal created", @data) if DEBUG

Template.materializeModal.onRendered ->
  console.log("materializeModal rendered", @data.title)  if DEBUG
  inDuration = 300
  if @data.fullscreen
    inDuration = 0
  @$('#materializeModal').openModal
    in_duration: inDuration
    ready: =>
      if @data.fullscreen
        Meteor.setTimeout ->
          console.log("move top for fullscreen") if DEBUG
          @$('#materializeModal').css('top', 0)
        , 5
      MaterializeModal.modalReady(@)
    complete: ->
      console.log("materializeModal: complete") if DEBUG
      MaterializeModal.remove()

#    Meteor.defer ->
#        $('#prompt-input')?.focus()


Template.materializeModal.onDestroyed ->
  console.log("materializeModal destroyed") if DEBUG


Template.materializeModal.helpers

  template: ->
    bodyTemplate = MaterializeModal.bodyTemplate.get()
    console.log("render template?", @) if DEBUG
    if bodyTemplate? and Template[@bodyTemplate]?
      console.log("render template", bodyTemplate) if DEBUG
      bodyTemplate


  templateData: ->
    if MaterializeModal.bodyTemplate.get()?
      @


  isForm: ->
    MaterializeModal.type is 'form'


  errorMessage: ->
    MaterializeModal.errorMessage.get()


  icon: ->
    if @icon
      @icon
    else
      console.log("icon: type", @type) if DEBUG
      switch @type
        when 'alert'
          'warning'
        when 'error'
          'error'


  modalFooter: ->
    @footerTemplate or 'materializeModalFooter'


  modalFooterData: ->
    _.extend({}, @, @footerTemplateData)


Template.materializeModal.events
  "click #closeButton": (e, tmpl) ->
    e.preventDefault()
    console.log('closeButton') if DEBUG
    MaterializeModal.doCallback(false, e)
    console.log('call closeModal') if DEBUG
    tmpl.$('#materializeModal').closeModal
      complete: ->
        MaterializeModal.remove()



  "click #submitButton": (e, tmpl) ->
    e.preventDefault()
    form = tmpl?.$('form')
    console.log('submit event:', e, "form:", form) if DEBUG
    if MaterializeModal.doCallback(true, e, form)
      console.log('call closeModal') if DEBUG
      tmpl.$('#materializeModal').closeModal
        complete: ->
          MaterializeModal.remove()



Template.materializeModalstatus.helpers
  progressMessage: ->
    #....
