var $ = require('jquery');
module.exports = {
    activate: function(){
        $('body').on('dblclick', '.tab-bar', function(e){
            if ( $(e.target).is('.tab-bar') ){
                atom.workspace.open();
            }
        });
    }
}
