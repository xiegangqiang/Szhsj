$.abc = function(x) {
	var sWidth = $(x).width()/4; //获取焦点图的宽度（显示面积）
	var len = $(x).find("ul li").length; //获取焦点图个数
	var index = 0;
	var picTimer;
	var innerWidth = document.documentElement.clientWidth/1;
	var innerHeight = document.documentElement.clientHeight;
	
	var marginper = innerWidth*0.1;
	
	$(x).css({width:innerWidth ,height:innerWidth/5});
	$(x).find("ul li").css({width:innerWidth/4,height:innerWidth/4});
	$(x).find("ul li img").css({width:innerWidth/6.5,height:innerWidth/6.5});
	
	//以下代码添加数字按钮和按钮后的半透明条，还有上一页、下一页两个按钮
	var btn = "<div class='btn' style='display:none'>";
	for(var i=0; i < len; i++) {
		btn += "<span></span>";
	}
	btn += "</div><div class='preNext pre'></div><div class='preNext next'></div>";
	$(".scroll-outer").append(btn);
	$(".scroll-outer").find(".btnBg").css("opacity",0.5);

	/*//为小按钮添加鼠标滑入事件，以显示相应的内容
	$(".scroll-outer").find(".btn span").css("opacity",0.4).mouseenter(function() {
		index = $(x).find(".btn span").index(this);
		showPics(index);
	}).eq(0).trigger("mouseenter");*/

	//上一页、下一页按钮透明度处理
	$(".scroll-outer").find(".preNext").css("opacity",0.2).hover(function() {
		$(this).stop(true,false).animate({"opacity":"0.5"},300);
	},function() {
		$(this).stop(true,false).animate({"opacity":"0.3"},300);
	});

	//上一页按钮
	$(".scroll-outer").find(".pre").click(function() {
		index -= 4;
		if(index < 0) {index = len-4;}
		showPics(index);
	});

	//下一页按钮
	$(".scroll-outer").find(".next").click(function() {
		index += 4;
		if(index >= len) {index = 0;}
		showPics(index);
	});

	//本例为左右滚动，即所有li元素都是在同一排向左浮动，所以这里需要计算出外围ul元素的宽度
	$(x).find("ul").css("width",sWidth * (len));
	
	//鼠标滑上焦点图时停止自动播放，滑出时开始自动播放
	/*$(x).hover(function() {
		clearInterval(picTimer);
	},function() {
		picTimer = setInterval(function() {
			index++;
			if(index == len) {index = 0;}
			showPics(index);
		},5000); //此代表自动播放的间隔，单位：毫秒
	}).trigger("mouseleave");*/
	
	//显示图片函数，根据接收的index值显示相应的内容
	function showPics(index) {
		//普通切换
		var nowLeft = -index*sWidth; //根据index值计算ul元素的left值
		$(x).find("ul").stop(true,false).animate({"left":nowLeft},500); //通过animate()调整ul元素滚动到计算出的position
		/*$(x).find("ul li").each(function(q){
			if(q == index){
				if(index == 0){
					$(x).find("ul li img").fadeOut(1000);
					$(this).find("img").fadeIn(1511);
				}else{
					$(x).find("ul li img").fadeOut(1111);
					$(this).find("img").fadeIn(1511);
				}
				return false;
			}
		});*/
		/*$(".scroll-outer .btn span").removeClass("on").eq(index).addClass("on"); //为当前的按钮切换到选中的效果
		$(".scroll-outer").find(".btn span").stop(true,false).animate({"opacity":"0.4"},1000).eq(index).stop(true,false).animate({"opacity":"1"},1000); //为当前的按钮切换到选中的效果
*/	}
			
	$(x).find("ul li").each(function(){
		$(this).find(".barlist dd img").each(function(src){
			$(this).click(function(){
				src = $(this).attr("src");
				var title = $(this).attr("title");
				var alt = $(this).attr("alt");
				$(this).parents("li").find("a").children("img").attr("src", src);
			})
		})
	})
	
	//gundong!!!
	/*$(x).on( 'mousewheel', function(event, delta) {
            if(delta > 0){
				index -= 1;
				if(index == -1) {index = len - 1;}
				showPics(index);
				return false;
			}else{
				index += 1;
				if(index == len) {index = 0;}
				showPics(index);
				return false;
			}
			 
        });*/
	
};
