<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <title>Swiper</title>
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1"
    />
    <!-- Link Swiper's CSS -->
    <link
      rel="stylesheet"
      href="https://unpkg.com/swiper/swiper-bundle.min.css"
    />

    <!-- Demo styles -->
    <style>
      html,
      body {
        position: relative;
        height: 100%;
      }

      body {
        background: #eee;
        font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
        font-size: 14px;
        color: #000;
        margin: 0;
        padding: 0;
      }

      .swiper {
        width: 100%;
        height: 100%;
      }

      .swiper-slide {
        text-align: center;
        font-size: 18px;
        background: #fff;

        /* Center slide text vertically */
        display: -webkit-box;
        display: -ms-flexbox;
        display: -webkit-flex;
        display: flex;
        -webkit-box-pack: center;
        -ms-flex-pack: center;
        -webkit-justify-content: center;
        justify-content: center;
        -webkit-box-align: center;
        -ms-flex-align: center;
        -webkit-align-items: center;
        align-items: center;
      }

      .swiper-slide img {
        display: block;
        width: 100%;
        height: 100%;
        object-fit: cover;
      }
    </style>
  </head>

  <body>
    <!-- Swiper -->
    <div class="swiper mySwiper2">
      <div class="swiper-wrapper">
        <div class="swiper-slide"><a href="eventMain.ev"><img alt="" src="images/event/event1.png" width="700px" height="215"></a></div>
        <div class="swiper-slide"><a href="eventMain.ev"><img alt="" src="images/event/event2.png" width="700px" height="215"></a></div>
        <div class="swiper-slide"><a href="eventMain.ev"><img alt="" src="images/event/event3.png" width="700px" height="215"></a></div>
        <div class="swiper-slide"><a href="eventMain.ev"><img alt="" src="images/event/event4.png" width="700px" height="215"></a>
		</div>
        
     

    </div>
      <div class="swiper-pagination"></div>
      
      <div class="swiper-scrollbar"></div>
    </div>

    <!-- Swiper JS -->
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

    <!-- Initialize Swiper -->
    <script>
    var swiper = new Swiper(".mySwiper2", {
    pagination: {
	    el: '.swiper-pagination',
	    type: 'bullets',
	  },

	  scrollbar: {
	    el: '.swiper-scrollbar',
	    draggable: true,
	  },
	  autoplay: {
		    delay: 4000,
		  },

		  loop: true
	});
    </script>
  </body>
</html>
