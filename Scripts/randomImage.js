<!-- This script which swaps the front page image each time the page reloads -->

<!-- This script and many more are available free online at -->
<!-- The JavaScript Source!! http://javascript.internet.com -->
<!-- Free JavaScripts provided by javascriptsource.com -->

<!-- Begin
// Set up the image files to be used.
// do not change the next line of code
var theImages = new Array() // do not change this
// do not change the above line of code

// ONLY AREA YOU MAY CHANGE
// To add more image files, continue with the
// pattern below, adding to the array.

theImages[0] = 'content/images/bg_Title_01.jpg' 
theImages[1] = 'content/images/bg_Title_02.jpg'
theImages[2] = 'content/images/bg_Title_03.jpg'



// DO NOT EDIT ANYTHING BELOW THIS LINE

var j = 0
var p = theImages.length;
var preBuffer = new Array()
for (i = 0; i < p; i++){
   preBuffer[i] = new Image()
   preBuffer[i].src = theImages[i]
}
var whichImage = Math.round(Math.random()*(p-1));
function showImage(){
    //alert(document.location.pathname);
    if(document.location.pathname == "/ttt/"){
        $("#headerimg").html('<img src="content/images/bg_Home.jpg" width="1100" height="327" border="0">');
        $("#td_id").attr('class', 'bg_pg1');
    }else{
        $("#headerimg").html('<img src="'+theImages[whichImage]+'" width="1100" height="106" border="0">');
        $("#td_id").attr('class', 'bg_pg2');
    }
}

//  End -->
