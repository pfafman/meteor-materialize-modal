Meteor-Materialize-Modal
====================

A pattern to display application modal dialogs via a [Materialize](http://materializecss.com), written in coffeescript.

*Warning: Only works with Meteor 1.0.4+*

## Install

```bash
meteor add pfafman:materialize-modal
```

## Usage

```
	MaterializeModal.[message|alert|error|confirm|prompt|form](options={})
```

### Options

* title - modal title. Can have HTML markup
* label - Strong label in front of body
* message - message body.  Can have HTML markup
* placeholder - If prompt then the placehoder for the text field
* callback(yesNo, data, event) - callback function with 
	* yesNo - bool true if the user hit the OK/Submit button
	* data - applicable data object key:value
	* event - event that triggered the callback
	
* bodyTemplate - Name of the template to use as the body for the modal.
* icon - Markup for the icon to display
* closeLabel - Text for close/dismiss button
* submitLabel - Text for ok/submit button
* fixedFooter - (bool) true if you want to use a [fixed footer](http://materializecss.com/modals.html#fixed-footer)
* bottomSheet - (bool) true if you want a bottom sheet modal
* fullscreen - (bool) Modal takes up all the full screen

## UI
You can change the UI by overwriting the CSS.

```
.materialize-modal {
  // See source for all the css vars
}
```

## Examples
To display a modal

```coffeescript

MaterializeModal.message
    title: 'Title'
    message: 'some message'
    
MaterializeModal.alert
    message: 'some message'

MaterializeModal.error
    message: 'some message'

MaterializeModal.confirm
    title: 'title'
    message: 'You feeling groovy?'
    callback: (yesNo) ->
    	if yesNo
    	    Materialize.toast("Glad to here it!", 3000, 'green')
    	else
    		Materialize.toast("Too bad")

MaterializeModal.prompt
	message: 'Enter something'
	callback: (yesNo, rtn, event) ->
		if yesNo
			Materialize.toast("You entered #{rtn}", 3000, 'green')

MaterializeModal.form
	bodyTemplate: 'testForm'
	callback: (yesNo, rtn, event) ->
		if yesNo
			console.log("Form data", rtn)         
```	

## TODO

* select modal
* fix loading modal
* progress modal with updates



## Notes

There might be are more undocumented options that need to be documented.  See code.

## License
MIT

