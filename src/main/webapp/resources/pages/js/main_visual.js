$(function(){

	var carouselWrap = $('#carousel-example-generic'),
		 typedTxtArr = [
			'모여서 각자 코딩하실 분 #모각코',
			'넷플릭스 블랙미러 전편 같이 달려요',
			'자취생 일주일 식단 서로 공유해요',
			'주말에 서울대공원 가서 그림 그려요'
		 ],
		 typed, typedObj;	

	var typedFunc = function( a, b ) {
		typed = new Typed(a[0], {
			strings: [
				typedTxtArr[ b ]
			],
			stringsElement: null,
			typeSpeed: 100,
			startDelay: 1000,
			smartBackspace: false,
			backSpeed: 60,
			backDelay: 5000,
			loop: true,
			loopCount: 5,
			showCursor: false,
			cursorChar: "|",
			attr: null,
			contentType: 'html',
			callback: function() {},
			preStringTyped: function() {},
			onStringTyped: function() {
				setTimeout(function(){
					carouselWrap.carousel('next');
				}, 2000);
			},
			resetCallback: function() {},
			onReset: function(self) { 
				
			}
		});
	}

	carouselWrap.on('slid.bs.carousel', function () {
		var idx =$(this).find('.active').index(),
			 typedObj = $('.typing').eq( idx );
			 typed.destroy();
			 typedFunc( typedObj, idx );
	});
	
	// init
	typedFunc( $('.typing').eq(0), 0); 

});