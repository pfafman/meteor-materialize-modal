
@DEBUG = false

#
# Global translation methods & helpers.
#
@t9nIt = (string) ->
  T9n?.get?(string) or string

Template.registerHelper 'mmT9nit', (string) ->
  t9nIt(string)

#
# Create instance of MaterializeModal to handle event and
# modal construction logic.
#
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
  # (1) Update the jQuery handle of the modal instance with the latest
  #     modal DOM element.
  #
  MaterializeModal.$modal = $ @find '#materializeModal'
  #
  # (2) Compute modal animation duration.
  #     Fullscreen modals should appear instantly.
  #     Otherwise, 300ms transition.
  #
  if @data.fullscreen then inDuration = 0 else 300
  #
  # (3) Call Materialize's openModal() method to make
  #     the modal content appear.
  #
  # Set a callback to handle destroying the materializeModal template
  # if the user "completes" the modal, for instance by clicking
  # the background.
  #
  MaterializeModal.$modal.openModal
    in_duration: inDuration
    ready: ->
      console.log "materializeModal: ready" if DEBUG
    complete: ->
      console.log "materializeModal: complete" if DEBUG
      MaterializeModal.close()

Template.materializeModal.onDestroyed ->
  console.log("Template.materializeModal.destroyed") if DEBUG

Template.materializeModal.helpers
  #
  # bodyTemplate: The name of the template that should be rendered
  #               in the modal's body area.
  #
  bodyTemplate: ->
    @bodyTemplate or null
  #
  # isForm: Only true when the modal is a form.
  #
  isForm: ->
    @type is 'form'
  #
  # icon: Return a Material icon code for the Modal.
  #
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
  #
  # modalFooter:
  #
  modalFooter: ->
    @footerTemplate or 'materializeModalFooter'
  #
  # modalFooterData:
  #
  modalFooterData: ->
    _.extend {}, @, @footerTemplateData

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
    if MaterializeModal.doCallback true, e, form
      console.log('call closeModal') if DEBUG
      MaterializeModal.close()



Template.materializeModalStatus.helpers
  progressMessage: ->
    #....
