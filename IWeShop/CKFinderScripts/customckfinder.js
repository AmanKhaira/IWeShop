function selectFileWithCKFinder(elementId, elementImg, resource) {
    CKFinder.modal({
        chooseFiles: true,
        width: 800,
        height: 600,
        resourceType: resource,
        onInit: function (finder) {
            finder.on('files:choose', function (evt) {
                debugger;
                var file = evt.data.files.first();
                var output = document.getElementById(elementId);
                output.value = file.getUrl();
                var img = document.getElementById(elementImg);
                img.src = file.getUrl();
                if (file.getUrl().includes(".pdf")) {
                    img.src = "/public/download/pdf.png";
                }
            });

            finder.on('file:choose:resizedImage', function (evt) {
                var output = document.getElementById(elementId);
                output.value = evt.data.resizedUrl;
            });
        }
    });
}