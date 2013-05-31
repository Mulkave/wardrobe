@Wardrobe.module "PostApp.Edit", (Edit, App, Backbone, Marionette, $, _) ->

  class Edit.Post extends App.Views.ItemView
    template: "post/templates/form"

    events:
      "click .preview" : "preview"
      "click .publish" : "save"

    onRender: ->
      @fillJSON()

    preview: (e) ->
      e.preventDefault()
      alert "Sorry can't preview it today"
      return @

    save: (e) ->
      e.preventDefault()
      @model.save
        title: @$('#title').val()
        content: @$('#content').val()
      ,
        success: (model, response) =>
          console.log "IT SAVED"
          App.vent.trigger "post:load"
        error: (model, error) =>
          console.log "IT ERRORED"

      return @
