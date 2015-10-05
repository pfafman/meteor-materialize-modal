
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
          @$('#materializeModal').css
            top: 0
            bottom: 0
        , 5
      #MaterializeModal.modalReady(@)
    complete: ->
      console.log("materializeModal: complete") if DEBUG
      MaterializeModal.close()


Template.materializeModal.onDestroyed ->
  console.log("materializeModal destroyed") if DEBUG


Template.materializeModal.helpers
  templateData: ->
    @ if MaterializeModal.bodyTemplate.get()?

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
