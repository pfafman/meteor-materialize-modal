Meteor-Materialize-Modal
========================

A pattern to display application modal dialogs via [Materialize](http://materializecss.com), written in coffeescript.

### [Demo Site](http://materializemodal.meteor.com)

*Warning: Only tested on Meteor 1.2+*

### Version 1.0 Changes
* *The callbacks have changed form in version 1.0 to reflect the 'node way'.*  So you need to change your callback from `callback(yesNo, ...)` to `callback(error, rtn)`.  `yesNo` is now at `rtn.submit`!  If you don't have time to make the change lock your package at the 0.4.0 version `meteor add pfafman:materialize-modal@=0.4.0`

* *There is now a very good example [***site***](http://materializemodal.meteor.com) done by [*@msolters*](https://github.com/msolters), who also did the refractoring work for version 1.0. and added new modals!*

## Install

```bash
meteor add pfafman:materialize-modal
```

or for the old callback version

```
meteor add pfafman:materialize-modal@=0.4.0
```


## Usage

```
	MaterializeModal.[message|alert|error|confirm|prompt|form|loading|progress](options={})
```

### Options

* title - modal title. Can have HTML markup
* label - Strong label in front of body
* message - message body.  Can have HTML markup
* placeholder - If prompt then the placehoder for the text field
* callback(error, rtn) - callback function with 
	* rtn.submit - bool true if the user hit the OK/Submit button
	* rtn.value - applicable data object key:value
	

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
    callback: (error, rtn) ->
    	if rtn?.submit
    	    Materialize.toast("Glad to here it!", 3000, 'green')
    	else
    		Materialize.toast("Too bad")

MaterializeModal.prompt
	message: 'Enter something'
	callback: (error, rtn) ->
		if rtn?.submit
			Materialize.toast("You entered #{rtn.value}", 3000, 'green')

MaterializeModal.form
	bodyTemplate: 'testForm'
	callback: (error, rtn ->
		if rtn.submit
			console.log("Form data", rtn.value)         
```	


## Notes

There might be are more undocumented options that need to be documented.  See code.

## License
MIT

