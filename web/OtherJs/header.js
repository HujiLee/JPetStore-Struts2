/**
 * Created by Administrator on 2016/3/27.
 */
function prepareKeywords(str) {
    if (str.indexOf('\"') == 0) {
        str = str.substring(1);
    }
    if (str.indexOf('\"') == str.length - 1) {
        str = str.substring(0, str.length - 1);
    }
    while (str.indexOf(" ") == 0 || str.indexOf('\t') == 0) {
        str = str.substring(1);
    }
    return str;
}
function showKeyword() {
    $('#select-keyword').attr('hide', 'no');
}
function hideKeyword() {
    $('#select-keyword').attr('hide', 'yes');

}
function mouseoverLi(me) {
    $('#search-input').val(me.innerHTML);
}
function get_search_keywords() {
    var str = $("#search-input").val().trim();
    console.log('str=' + str + ' value=' + $("#search-input")[0].value)
    //alert(str);
    //console.log(str.indexOf(' '));
    if (str != null) {
        $('#select-keyword').empty();
        $.post("searchItem", {"item.name": str}, function (data, status, xObj) {
            var dataArray = data;

            //alert(dataArray[0]); //得到搜索的数组
            console.log(dataArray);
            console.log('length=' + dataArray.length + ' ');
            console.log(dataArray[5]);
            if (dataArray.length > 1)//因为服务端有个问题是在没有结果的情况下也会有一个结果= = 比如'kp'
            {
                for (var x = 0; x < dataArray.length; x++) {
                    Li = document.createElement('li');
                    Li.innerHTML = prepareKeywords(dataArray[x].name);
                    Li.setAttribute('onmouseover', "console.log(this.innerHTML);mouseoverLi(this);");
                    //Li.setAttribute('onmouseout',"$('#search-input').val(\'"+str+"\');");
                    $('#select-keyword')[0].appendChild(Li);

                }

            }


        });

    }
    //if(str.empty())

}