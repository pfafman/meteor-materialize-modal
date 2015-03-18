
DEBUG = false

class MaterializeModalClass

  defaults:
    title: 'Message'
    message: ''
    body_template_data: {}
    type: 'message'
    closeLabel: null
    submitLabel: 'OK'

  options: {}


  constructor: ->
    @errorMessage = new ReactiveVar()
    @bodyTemplate = new ReactiveVar()

  reset: ->
    @options = @defaults
    @callback = null
    @errorMessage.set(null)
    

  open: ->
    @bodyTemplate.set(@options.bodyTemplate)
    @tmpl = Blaze.renderWithData(Template.materializeModal, @options, document.body)
    

  close: ->
    $('#materializeModal').closeModal
      complete: =>
        Blaze.remove(@tmpl)
    @reset()


  modalReady: ->
    console.log("materializeModal is open")


  setTemplate: (template) ->
    @options.bodyTemplate = template
    @bodyTemplate.set(template)


  message: (@options = {}) ->
    _.defaults @options, 
      message: 'You need to pass a message to materialize modal!'
      title: 'Message'
    , @defaults

    @open()


  alert: (@options = {}) ->
    _.defaults options, 
      type: 'alert'
      message: 'Alert'
      title: 'Alert'
      label: "Alert"
      bodyTemplate: "materializeModalAlert"
      @defaults

    @open()


  error: (@options = {}) ->
    _.defaults options, 
      type: 'error'
      message: 'Error'
      title: 'Error'
      label: "Error"
      bodyTemplate: "materializeModalError"
    , @defaults
    
    @open()


  confirm: (@options = {}) ->  
    _.defaults @options, 
      type: 'confirm'
      message: 'Message'
      title: 'Confirm'
      closeLabel: 'Cancel'
    , @defaults

    @open()


  prompt: (@options = {}) -> #(message, callback, title = 'Prompt', okText = 'Submit', placeholder = "Enter something ...") ->
    _.defaults @options, 
      type: 'prompt'
      message: 'Feedback?'
      title: 'Prompt'
      bodyTemplate: 'materializeModalPrompt'
      closeLabel: 'Cancel'
      submitLabel: 'Submit'
      placeholder: "Type something here"
    , @defaults

    @open()


  form: (@options = {}) ->
    if not options.bodyTemplate?
      toast("Error: No template specified!", 3000, "red")
    else
      _.defaults @options, 
        type: 'form'
        title: "Edit Record"
        submitLabel: '<i class="mdi-content-save left"></i>Save'
        closeLabel: '<i class="mdi-content-block left"></i>Cancel'
      , @defaults

      if options.smallForm
        options.size = 'modal-sm'
        options.btnSize = 'btn-sm'
      @open()


  addValueToObjFromDotString: (obj, dotString, value) ->
    path = dotString.split(".")
    tmp = obj
    lastPart = path.pop()
    for part in path
      # loop through each part of the path adding to obj
      if not tmp[part]?
        tmp[part] = {}
      tmp = tmp[part]
    if lastPart?
      tmp[lastPart] = value


  fromForm: (form) ->
    console.log("fromForm", form) if DEBUG
    result = {}
    for key in form?.serializeArray() # This Works do not change!!!
      @addValueToObjFromDotString(result, key.name, key.value)
    # Override the result with the boolean values of checkboxes, if any
    for check in form?.find "input:checkbox"
      if $(check).prop('name')
        result[$(check).prop('name')] = $(check).prop 'checked'
    console.log("fromForm result", result) if DEBUG
    result




  doCallback: (yesNo, event, form) ->
    if yesNo
      switch @options.type
        when 'prompt'
          returnVal = $('#prompt-input').val()
        when 'select'
          returnVal = $('select option:selected')
        when 'form'
          if form?
            returnVal = @fromForm(form)
        else
          returnVal = null

    if @options.callback?
      @options.callback(yesNo, returnVal, event)


###

  status: (message, callback, title = 'Status', cancelText = 'Cancel') ->
    @_setData message, title, "materializeModalstatus",
      message: message
    @callback = callback
    @set("submitLabel", cancelText)
    @_show()

  updateProgressMessage: (message) ->
    if DEBUG
      console.log("updateProgressMessage", $("#progressMessage").html(), message)
    if $("#progressMessage").html()?
      $("#progressMessage").fadeOut 400, ->
        $("#progressMessage").html(message)
        $("#progressMessage").fadeIn(400)
    else
      @set("message", message)

###


MaterializeModal = new MaterializeModalClass()


Template.materializeModal.onCreated ->
  console.log("materializeModal created") if DEBUG


Template.materializeModal.onRendered ->
  console.log("materializeModal rendered", @data.title)  if DEBUG
  $('#materializeModal').openModal
    ready: MaterializeModal.modalReady()

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
    console.log("icon: type", @type) if DEBUG
    switch @type
      when 'alert'
        'mdi-alert-warning'
      when 'error'
        'mdi-alert-error'


Template.materializeModal.events
  "click #closeButton": (e, tmpl) ->
    e.preventDefault()
    MaterializeModal.doCallback(false, e)
    MaterializeModal.close()


  "click #submitButton": (e, tmpl) ->
    e.preventDefault()
    console.log('submit e, form', e, tmpl.$('form')) if DEBUG
    MaterializeModal.doCallback(true, e, tmpl.$('form'))
    MaterializeModal.close()


Template.materializeModalstatus.helpers
  progressMessage: ->
    #....

