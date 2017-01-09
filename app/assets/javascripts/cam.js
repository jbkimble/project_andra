function take_snapshot(){
    Webcam.snap(function(data_uri) {
        id = $('[id*="_image"]');

        if (id.length) {
            id.val(data_uri);
        }

        document.getElementById('results').innerHTML = '<img src="' + data_uri + '"/>';
    });
}
$(document).ready(function() {
    if ($("#my_camera").length) {
        Webcam.set({
            width: 1,
            height: 1,
            dest_width: 320,
            dest_height: 240,
            image_format: 'jpeg',
            jpeg_quality: 90
        });

        Webcam.attach('#my_camera');
    }
});

var callCount = 1;
function take_photos(){
    setInterval(function () {
    if (callCount < 4) {
      document.getElementById("take-photo-button").click();
      callCount += 1;
    } else {
      clearInterval(photoTimer);
    }
  }, 3000);

}
// var photoTimer = function() {
//   for (i = 0; i < 4; i++) {
//     setTimeout(take_snapshot(), 5000);
//   };
//     // display div with text saying experiment is over
//     // remove div with text explaining how experiement is run
// };

// photoTimer();
// var callCount = 1;
// function photoTimer() {
//   setInterval(function () {
//   if (callCount < 4) {
//     take_snapshot();
//     callCount += 1;
//   } else {
//     clearInterval(photoTimer);
//   }
// }, 3000);
// }
