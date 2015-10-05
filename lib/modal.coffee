
@DEBUG = true

@t9nIt = (string) ->
  T9n?.get?(string) or string

Template.registerHelper 'mmT9nit', (string) ->
  t9nIt(string)

MaterializeModal = new MaterializeModalClass()

###
#     Template.materializeModalContainer
###
Template.materializeModalContainer.helpers
  modalOptions: ->
    Template.currentData().get() or null

###
#     Template.materializeModal
###
Template.materializeModal.onCreated ->
  console.log("Template.materializeModal.created", @data) if DEBUG

Template.materializeModal.onRendered ->
  console.log("Template.materializeModal.rendered", @data.title)  if DEBUG
  #
  # Fullscreen modals should appear instantly.
  # Otherwise, give a 300ms transition.
  #
  inDuration = 300
  if @data.fullscreen
    inDuration = 0
  #
  # Call Materialize's openModal() method to make
  # the modal content appear.
  #
  # Set a callback to handle destroying the materializeModal template
  # if the user "completes" the modal, for instance by clicking
  # the background.
  #
  @$('#materializeModal').openModal
    in_duration: inDuration
    ready: =>
      console.log "materializeModal: ready" if DEBUG
    complete: ->
      console.log("materializeModal: complete") if DEBUG
      MaterializeModal.close()

Template.materializeModal.onDestroyed ->
  console.log("Template.materializeModal.destroyed") if DEBUG

Template.materializeModal.helpers
  templateData: ->
    @data if Template.currentData().bodyTemplate?

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
    MaterializeModal.doCallback false, e
    console.log('call MaterializeModal.close()') if DEBUG
    MaterializeModal.close()

  "click #submitButton": (e, tmpl) ->
    e.preventDefault()
    form = tmpl?.$('form')
    console.log('submit event:', e, "form:", form) if DEBUG
    if MaterializeModal.doCallback(true, e, form)
      console.log('call closeModal') if DEBUG
      MaterializeModal.close()



Template.materializeModalstatus.helpers
  progressMessage: ->
    #....
