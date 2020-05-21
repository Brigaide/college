// User-triggered (Manual) Random image selection using arrays
var iconImg;
var pictures = [ "michael.jpeg", "erin.jpeg", "mishka.jpeg"];
var descriptions = [ "Michael Kruse", "Erin Schlavin", "Mishka Thacker"];
var int;
var index = 0;

//document.getElementById("stopbutton").addEventListener("click", stopfunc());

// every time
// a user clicks on the start button
// pick a random image and corresponding description then modify
// the img element in the document's body
function pickImage()
{
   document.getElementById("big").setAttribute("src", pictures[index]);
   document.getElementById("big").setAttribute("alt", "michael.jpeg");
   index = (index + 1) % 3;
   //document.slideshow.src = pictures[index];

} // end function pickImage

// registers iconImg's click event handler
// so it adds an event listener to the image displayed by the img tag
// specified in the HTML file
function startfunc()
{
   int = clearInterval(int);
   int = setInterval(pickImage, 2000);

}
// end function start

function stopfunc()
{
  int = clearInterval(int);
}
