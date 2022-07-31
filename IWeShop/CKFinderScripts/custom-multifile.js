function selectMultiFileWithCKFinder(elementId, resource) {
    CKFinder.modal({
        chooseFiles: true,
        width: 800,
        resourceType: resource,
        onInit: function (finder) {
            finder.on('files:choose', function (evt) {
                var output = document.getElementById(elementId);
                $("#dvThumbs").empty();
                //output.value = file.getUrl();
                for (var i = 0; i < evt.data.files.length; i++) {
                    var file = evt.data.files.models[i];
                    var url = file.getUrl();
                    output.value = output.value + '|' + file.getUrl();
                    var theId = 'thumb' + i;
                    //var pic = $('<img id="' + theId + '"class="img-responsive img-thumbnail img-size-60" onclick="RemoveImage('+theId+','+elementId+')">');
                    var pic = $('<img class="img-responsive img-thumbnail img-size-60" >');
                    pic.attr('src', url);
                    $("#dvThumbs").append('<span class="spanthumb" id="' + theId + '"><span class="thumb-delete" onclick="RemoveImage(' + theId + ',' + elementId + ')"></span></span>');
                    $("#dvThumbs #" + theId).append(pic);
                }
            });

            finder.on('file:choose:resizedImage', function (evt) {
                var output = document.getElementById(elementId);
                output.value = evt.data.resizedUrl;
            });
        }
    });
}

function RemoveImage(theId, theElementId) {
    $("#dvThumbs #" + theId.id).remove();
    var theSrc = theId.children[1].src
    var url = theSrc.replace(/^.*\/\/[^\/]+/, '')
    var output = theElementId.value;
    output = output.replace('|' + url, '');
    theElementId.value = output;
}