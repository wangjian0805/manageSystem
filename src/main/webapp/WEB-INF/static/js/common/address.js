
//var delcity=['220200','220300','220400','220500','220600','220700','220800','222400','371500','430600'];
var delcity=[];
var deldistrict=[];
var checkAddressIsSendFlag = true;//用于前端来判断当前选择的地址是否能够配送的标志

function selectProvince() {
    $.ajax(
    {
        type: "get",
        url: "../addressSelect",
        data: {"parentCode":"0001"},
        success: function (msg) {
        	var json =msg;
            for (var i = 0; i < json.length; i++) {
            	
                $("#province").append("<option value=" + json[i].areacode + ">" + json[i].areaname + "</option>");
            }
            selectCity();
        }
    })
};

function selectProvince(province) {
    $.ajax(
        {
            type: "get",
            url: "../addressSelect",
            data: {"parentCode":"0001"},
            success: function (msg) {
                var json =msg;
                for (var i = 0; i < json.length; i++) {
                    if(json[i].areacode == province) {
                        $("#province").append("<option value=" + json[i].areacode + " selected=selected>" + json[i].areaname + "</option>");
                    }else{
                        $("#province").append("<option value=" + json[i].areacode + ">" + json[i].areaname + "</option>");
                    }
                }
                selectCity();
            }
        })
};

function selectProvince(province, city, district) {
    $.ajax(
        {
            type: "get",
            url: "../addressSelect",
            data: {"parentCode":"0001"},
            success: function (msg) {
            	var json =msg;
                for (var i = 0; i < json.length; i++) {
                    if(json[i].areacode == province) {
                        $("#province").append("<option value=" + json[i].areacode + " selected=selected>" + json[i].areaname + "</option>");
                    }else{
                        $("#province").append("<option value=" + json[i].areacode + ">" + json[i].areaname + "</option>");
                    }
                }
                selectCity(city, district);
            }
        })
};

function selectCity() {
	   $("#city").html("");
	   $.ajax(
	   {
	       type: "get",
	       url: "../addressSelect",
	       data: {"parentCode":$("#province").val() },
	       success: function (msg) {
	    	   var json =msg;
	    	   var j = 0;
	           for (var i = 0; i < json.length; i++) {
	        	   $("#city").append("<option value=" + json[i].areacode + ">" + json[i].areaname + "</option>");
	           }
	           selectDistrict();
	       }
	   })
};

function selectCity(city) {
    $("#city").html("");
    $.ajax(
        {
            type: "get",
            url: "../addressSelect",
            data: {"parentCode":$("#province").val() },
            success: function (msg) {
            	var json =msg;
                var j = 0;
                for (var i = 0; i < json.length; i++) {
                	if(json[i].areacode == city) {
       				   $("#city").append("<option value=" + json[i].areacode + " selected=selected>" + json[i].areaname + " </option>");
       			   }else{
       				   $("#city").append("<option value=" + json[i].areacode + ">" + json[i].areaname + " </option>");
       			   }
                }
                selectDistrict();
            }
        })
};

function selectCity(city, district) {
    $("#city").html("");
    $.ajax(
        {
            type: "get",
            url: "../addressSelect",
            data: {"parentCode":$("#province").val() },
            success: function (msg) {
            	var json =msg;
                var j = 0;
                for (var i = 0; i < json.length; i++) {
                	if(json[i].areacode == city) {
        				   $("#city").append("<option value=" + json[i].areacode + " selected=selected>" + json[i].areaname + " </option>");
        			   }else{
        				   $("#city").append("<option value=" + json[i].areacode + ">" + json[i].areaname + " </option>");
        			   }
                }
                selectDistrict(district);
            }
        })
};

function selectDistrict() {
    $("#district").html("");
    $.ajax(
    {
        type: "get",
        url: "../addressSelect",
        data: {"parentCode":$("#city").val() },
        success: function (msg) {
        	var json =msg;
        	var j = 0;
            for (var i = 0; i < json.length; i++) {
            	$("#district").append("<option value=" + json[i].areacode + ">" + json[i].areaname + "</option>");
            }
        }
    })
};

function selectDistrict(district) {
    $("#district").html("");
    $.ajax(
        {
            type: "get",
            url: "../addressSelect",
            data: {"parentCode":$("#city").val() },
            success: function (msg) {
            	var json =msg;
                var j=0;
                for (var i = 0; i < json.length; i++) {
                	if(json[i].areacode == district) {
                        $("#district").append("<option value=" + json[i].areacode + " selected=selected>" + json[i].areaname + "</option>");
                    }else{
                        $("#district").append("<option value=" + json[i].areacode + ">" + json[i].areaname + "</option>");
                    }
                }
            }
        })
};