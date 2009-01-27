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

var TrstWindow = {
  public_pg: function(arg1){
    new Ajax.Request('trst_public/pg?' + arg1,{
      onCreate: function(){
        $('flash-loading').show()
      },
      onComplete: function(){
        $('flash-loading').hide()
      }
    })
  },
  info: function(arg1){
    new Ajax.Request('trst_sys/task?type=info&id=' + arg1,{
      onCreate: function(){
        $('flash-loading').show()
      },
      onComplete: function(){
        $('flash-loading').hide()
      }
    })
  },
  exe: function(arg1){
    new Ajax.Request('trst_sys/task?type=exe&id=' + arg1,{
      onCreate: function(){
        $('flash-loading').show()
      },
      onComplete: function(){
        $('flash-loading').hide()
      }
    })
  },
  edit: function(arg1,arg2){
    new Ajax.Request('trst_sys/task?type=edit&id=' + arg1 + '&obj_id=' + arg2,{
      onCreate: function(){
        $('flash-loading').show()
      },
      onComplete: function(){
        $('flash-loading').hide()
      }
    })
  },
  show: function(arg1,arg2){
    new Ajax.Request('trst_sys/task?type=show&id=' + arg1 + '&obj_id=' + arg2,{
      onCreate: function(){
        $('flash-loading').show()
      },
      onComplete: function(){
        $('flash-loading').hide()
      }
    })
  },
  remove: function(arg1,arg2){
    new Ajax.Request('trst_sys/task?type=remove&id=' + arg1 + '&obj_id=' + arg2 + '&remove=true',{
      onCreate: function(){
        $('flash-loading').show()
      },
      onComplete: function(){
        $('flash-loading').hide()
      }
    })
  },
  mce_edit: function(arg1,arg2,arg3,arg4){
    Lightview.show({
      href: 'trst_sys/mce_edit?type=edit&id=' + arg1 + '&obj_name=' + arg2 + '&obj_id=' + arg3 + '&obj_method=' + arg4,
      title: "Editor de text",
      options: {
        autosize: false,
        width: 760,
        height: 490
      }
    })
  }
};

Effect.Unfold = function(element){
  element = $(element);
  var elementDimensions = element.getDimensions();
  var oldStyle = {
    top: element.style.top,
    left: element.style.left,
    width: element.style.width,
    height: element.style.height
  };
  element.makeClipping();
  return new Effect.Scale(element, 100, Object.extend({
    scaleContent: false,
    scaleY: false,
    scaleFrom: 1,
    scaleMode: {
      originalHeight: elementDimensions.height,
      originalWidth: elementDimensions.width
    },
    afterSetup: function(effect){
      effect.element.makeClipping().setStyle({
        width: '1px',
        height: '10px'
      }).show();
    },
    afterFinishInternal: function(effect){
      new Effect.Scale(element, 100, {
        scaleContent: false,
        scaleX: false,
        scaleFrom: 5,
        scaleMode: {
          originalHeight: elementDimensions.height,
          originalWidth: elementDimensions.width
        },
        restoreAfterFinish: true,
        afterSetup: function(effect){
          effect.element.makeClipping().setStyle({
            height: '1px'
          }).show();
        },
        afterFinishInternal: function(effect){
          effect.element.undoClipping().setStyle(oldStyle);
        }
      });
    }
  }, arguments[1] ||
  {}));
};
