$(document).ready(function() {
  $(".movie").waypoint(function(direction) {
    console.log(direction)
      if (direction === "down") {
        $(this.element).removeClass("fadeOutUp");
        $(this.element).addClass("fadeInUp");
        
      }else if(direction === "up"){
        $(this.element).removeClass("fadeInUp");
      $(this.element).addClass("fadeOutUp");
      
      }
      }, { offset: "50%" });
});

