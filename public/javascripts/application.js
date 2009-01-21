// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
var Flash = {
  show: function(flashType, message){
    new Effect.ScrollTo('flash-' + flashType);
    $('flash-' + flashType).innerHTML = '';
    if (message.toString().match(/<li/))
      message = "<ul>" + message + '</ul>'
    $('flash-' + flashType).innerHTML = message;
    new Effect.Appear('flash-' + flashType, {
      duration: 0.5
    });
    setTimeout(Flash['fade' + flashType[0].toUpperCase() + flashType.slice(1, flashType.length)].bind(this), 3000)
  },

  error: function(message){
    this.show('error', message);
  },

  // Notice-level messages.  See Messenger.error for full details.
  notice: function(message){
    this.show('notice', message);
  },

  // Notice-level messages.  See Messenger.error for full details.
  loading: function(message){
    this.show('loading', message);
  },

  // Responsible for fading notices level messages in the dom
  fadeNotice: function(){
    new Effect.Fade('flash-notice', {
      duration: 0.3
    });
  },

  // Responsible for fading error messages in the DOM
  fadeError: function(){
    new Effect.Fade('flash-error', {
      duration: 0.3
    });
  },

  // Responsible for fading loading messages in the DOM
  fadeLoading: function(){
    new Effect.Fade('flash-loading', {
      duration: 0.3
    });
  }
}
