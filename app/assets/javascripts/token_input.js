var ready = function () {  
              $("#topic_tag_tokens").tokenInput("/tags.json", {
                crossDomain: false,
                prePopulate: $('#topic_tag_tokens').data('pre'),
                theme: 'facebook'
              });
            };

$(document).on('page:load', ready)
$(document).ready(ready)
