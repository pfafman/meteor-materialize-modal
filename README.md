Meteor-Materialize-Modal
====================

A pattern to display application modal dialogs via a Materialize, written in coffeescript.


##Install

Install via atmosphere.

```bash
meteor add pfafman:materialize-modal
```

##Usage

Include the following in your template:

```html
{{> materializeModal}}
```

To display an alert

```coffeescript

MaterializeModal.message
    message: 'some message'
    title: 'Title'

MaterializeModal.alert
    message: 'some message'

MaterializeModal.error
    message: 'some message'

MaterializeModal.confirm
    message: 'some message'
    title: 'title
    callback: callback

```	


##Notes

There are more undocumented options that need to be documented.



