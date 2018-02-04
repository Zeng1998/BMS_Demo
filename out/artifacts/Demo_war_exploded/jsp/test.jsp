<%--
  Created by IntelliJ IDEA.
  User: russell
  Date: 18-2-2
  Time: 下午7:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.11.1/bootstrap-table.min.css">
    <link rel="stylesheet" href="../static/css/bootstrap.css">
    <style type="text/css">
        #mytable{
            
        }
    </style>
</head>
<body>
<div class="panel panel-default">
    <div class="panel-body">
        <table id="mytable">

        </table>
    </div>
</div>
<script type="text/javascript" src="https://cdn.bootcss.com/jquery/2.1.0/jquery.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.11.1/bootstrap-table.min.js"></script>
<script type="text/javascript">
    $(function () {
        var t=$("#mytable").bootstrapTable({
            url:'http://localhost:8080/jsp/test.jsp',
            method:'get',
            dataType:"json",
            striped:true,
            undefinedText:"空",
            pagination:true,
            showToggle:"true",
            showColumns:"true",
            pageNumber:1,
            pageSize:10,
            pageList:[5,10,20,40],
            paginationPreText:'<',
            paginationNextText:'>',
            search:false,
            data_local:"zh-US",
            sidePagination:"server",
            queryParams:function (params) {
                return{
                    cp:params.offset,
                    ps:params.limit
                };
            },
            idField:"id",
            columns:[
                {
                    title:"编号",
                    field:'id',
                    align:'center'
                },
                {
                    title:"书名",
                    field:'name',
                    align:'center'
                },
                {
                    title:"作者",
                    field:'author',
                    align:'center'
                },
                {
                    title:"出版时间",
                    field:'pub_time',
                    align:'center'
                },
                {
                    title:"类型",
                    field:'type',
                    align:'center'
                },
                {
                    title:"操作",
                    field:'do',
                    align:'center',
                    formatter:function (value,row,index) {
                        return '<a href="#" mce_href="#" onclick="edit('/'+row.id+'/')">操作</a>'
                    }
                }
            ]
        })
        t.on('load-success.bs.table',function (data) {
            console.log("load success");
            $(".pull-right").css("display","block");
        })
    })
</script>
</body>
</html>
