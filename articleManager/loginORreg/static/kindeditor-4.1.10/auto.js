function df() {
alert("auto.js�Ѿ�����");
    var haspicContainer = document.getElementById("has_pic");
    if (haspicContainer == null) {
        haspicContainer = document.createElement("div");
        haspicContainer.id = "has_pic";
        haspicContainer.innerHTML = "<input type='text' id='piclist' value='' style='display:none;'/><div id='upload'><b>����ͼƬ��Ҫ�ϴ���������</b>&nbsp;&nbsp;<a href='javascript:uploadpic();' >�ϴ�</a></div><div id='confirm'></div>";
        $(".ke-toolbar").after(haspicContainer);
    }

    var img = $(".ke-edit-iframe").contents().find("img");

    var piccount = 0;
    var sstr = "";
    $(img).each(function (i) {
        var that = $(this);
        if (that.attr("src").indexOf("http://") >= 0 || that.attr("src").indexOf("https://") >= 0) {
            piccount++;
            if (i == $(img).length - 1)
                sstr += that.attr("src");
            else
                sstr += that.attr("src") + "|";
        }
    });

    $("#piclist").val(sstr);
    document.getElementById("has_pic").style.display = (piccount > 0) ? "block" : "none";
}

function closeupload() {
    $("#has_pic").hide();
    $("#upload").show();
}

function uploadpic() {
    var piclist = encodeURI($("#piclist").val());
    if (piclist.length == 0) return false;

    $.ajax({
        url: '/account/docupload/',
        data: "pic=" + piclist,
        type: "GET",
        beforeSend: function () {
            $("#upload").hide();
            $("#confirm").text("�����ϴ���...");
        },
        success: function (msg) {
            if (msg !== "") {
                var str = new Array();
                str = msg.split('|');
                var img = $(".ke-edit-iframe").contents().find("img");

                $(img).each(function (i) {
                    var that = $(this);
                    if (that.attr("src").indexOf("http://") >= 0 || that.attr("src").indexOf("https://") >= 0) {
                        that.attr("src", "../image/upload/" + str[i]);
                        that.attr("data-ke-src", "../image/upload/" + str[i]);
                    }
                });

                $("#confirm").html(img.length + "��ͼƬ�Ѿ��ϴ��ɹ���&nbsp;&nbsp;<a href='javascript:closeupload();'>�ر�</a>");
            }
            else $("#confirm").text("�ϴ�ʧ�ܣ�");
        }
    });
}