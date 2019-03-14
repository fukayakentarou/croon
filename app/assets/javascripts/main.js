$(document).ready(function() {
  $(".movie").waypoint(function(direction) {
     //  console.log(direction);
      if (direction === "down") {
        //  $(this.element).removeClass("fadeOutUp");
        $(this.element).addClass("fadeInUp");
        this.destroy();
    }
  }, { offset: "65%" });
});


 $(function(){
    $(document).ready(function(){

      $(".sp.glyphicon.glyphicon-th-list").click(function () {
        $(this).next().slideToggle();
      });

    });
  });