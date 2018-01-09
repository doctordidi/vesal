<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="../../../public/tag.jsp" %>
<html>
<head>
    <title>ModuleOne</title>
    <script type="text/javascript" src="${baseurl}/public/common/js/jquery-3.2.0.min.js"></script>
    <script src="${baseurl}/public/common/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${baseurl}/public/fileOperator/upload/ajax.js"></script>
    <script type="text/javascript" src="${baseurl}/public/fileOperator/ajaxfileupload.js"></script>
    <script type="text/javascript" src="${baseurl}/public/fileOperator/download/zip.js"></script>
    <link rel="stylesheet" href="${baseurl}/public/common/layui/css/layui.css" media="all">
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/common/layui/css/layui.css" media="all">
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/common/bootstrap/css/bootstrap.min.css" media="all">
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/common/css/global.css" media="all">
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/css/common.css" media="all">
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/css/personal.css" media="all">
    <script src="${baseurl}/public/js/vue.min.js"></script>
    <style>
        .upload_warp_img_div_del {
            position: absolute;
            top: 6px;
            width: 16px;
            right: 4px;
        }

        .upload_warp_img_div_top {
            position: absolute;
            top: 0;
            width: 100%;
            height: 30px;
            background-color: rgba(0, 0, 0, 0.4);
            line-height: 30px;
            text-align: left;
            color: #fff;
            font-size: 12px;
            text-indent: 4px;
        }

        .upload_warp_img_div_text {
            white-space: nowrap;
            width: 80%;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        .upload_warp_img_div img {
            max-width: 100%;
            max-height: 100%;
            vertical-align: middle;
        }

        .upload_warp_img_div {
            position: relative;
            height: 100px;
            width: 120px;
            border: 1px solid #ccc;
            margin: 0px 30px 10px 0px;
            float: left;
            line-height: 100px;
            display: table-cell;
            text-align: center;
            background-color: #eee;
            cursor: pointer;
        }

        .upload_warp_img {
            border-top: 1px solid #D2D2D2;
            padding: 14px 0 0 14px;
            overflow: hidden
        }

        .upload_warp_text {
            text-align: left;
            margin-bottom: 10px;
            padding-top: 10px;
            text-indent: 14px;
            border-top: 1px solid #ccc;
            font-size: 14px;
        }

        .upload_warp_right {
            float: left;
            width: 57%;
            margin-left: 2%;
            height: 100%;
            border: 1px dashed #999;
            border-radius: 4px;
            line-height: 130px;
            color: #999;
        }

        .upload_warp_left img {
            margin-top: 32px;
        }

        .upload_warp_left {
            float: left;
            width: 40%;
            height: 100%;
            border: 1px dashed #999;
            border-radius: 4px;
            cursor: pointer;
        }

        .upload_warp {
            margin: 14px;
            height: 130px;
        }

        .upload {
            border: 1px solid #ccc;
            background-color: #fff;
            width: 650px;
            box-shadow: 0px 1px 0px #ccc;
            border-radius: 4px;
        }

        .hello {
            width: 650px;
            margin-left: 34%;
            text-align: center;
        }
    </style>
</head>
<body>
<section class="larry-grid">
    <div class="larry-personal">
        <div class="layui-tab">
            <blockquote class="layui-elem-quote mylog-info-tit">
                <div class="container">
                    <div class="row">
                        <form role="form" action="${baseurl}/upload/spring" method="post"
                              enctype="multipart/form-data">
                            <div class="form-group">
                                <label for="upload_file">文件</label> <input type="file" multiple
                                                                          id="upload_file"
                                                                          name="upload_file">
                                <p class="help-block">目前只支持zip文件的上传格式</p>
                            </div>
                            <button type="submit" class="btn btn-default">上传</button>
                        </form>
                        ${msg }
                    </div>
                </div>
            </blockquote>

            <blockquote>
                <div class="container">
                    <div class="row">
                        <div class="table-responsive col-sm-10">
                            <table class="table">
                                <thead>
                                <tr>
                                    <th>序列</th>
                                    <th>文件名</th>
                                    <th>下载</th>
                                </tr>
                                </thead>
                                <tbody id="showInfo">
                                <c:forEach var="file" items="${files }" varStatus="cur">
                                    <tr>
                                        <td>${cur.index+1 }</td>
                                        <td><a href="javascript:void(0);" class="downloadfile"
                                               data-file-path="${file.absolutePath }"><strong>${file.name }</strong></a>
                                        </td>
                                        <td><a href="javascript:void(0);" class="downloadzipfile"
                                               data-file-path="${file.absolutePath }"><strong>zip</strong></a></td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <form id="downloadfile" name="downloadfile" class="hide" method="post"
                          action="${baseurl }/download/file"
                          target="downloadFrom">
                        <input type="hidden" id="filepath" name="filepath" value=""/>
                    </form>
                    <form id="downloadzip" name="downloadzip" class="hide" method="post"
                          action="${baseurl }/download/zip"
                          target="downloadFrom">
                        <input type="hidden" id="zippath" name="zippath" value=""/>
                    </form>
                    <iframe name="downloadFrom" style="display: none;"></iframe>
                </div>
            </blockquote>
            <div class="larry-separate"></div>

            <div id="demo1"></div>
        </div>
    </div>
</section>

<%--<div id="app">--%>
    <%--<div class="hello">--%>
        <%--<div class="upload">--%>
            <%--<form role="form" action="${baseurl}/upload/spring" method="post" enctype="multipart/form-data">--%>
                <%--&lt;%&ndash;<div class="upload_warp">&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<div class="upload_warp_left" @click="fileClick">&ndash;%&gt;--%>
                        <%--&lt;%&ndash;<img src="${baseurl}/public/images/update/upload.png">&ndash;%&gt;--%>
                    <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<div class="upload_warp_right" @drop="drop($event)" @dragenter="dragenter($event)"&ndash;%&gt;--%>
                         <%--&lt;%&ndash;@dragover="dragover($event)">&ndash;%&gt;--%>
                        <%--&lt;%&ndash;或者将文件拖到此处&ndash;%&gt;--%>
                    <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                <%--<div class="upload_warp_text">--%>
                    <%--选中{{imgList.length}}张文件，共{{bytesToSize(this.size)}}--%>
                <%--</div>--%>
                <%--<input type="file" id="upload_file" name="upload_file" multiple--%>
                       <%--/>--%>
                    <%--&lt;%&ndash;<input type="file" id="upload_file" name="upload_file" multiple&ndash;%&gt;--%>
                       <%--&lt;%&ndash;@change="fileChange($event)"/>&ndash;%&gt;--%>
                <%--<div class="upload_warp_img" v-show="imgList.length!=0">--%>
                    <%--<div class="upload_warp_img_div" v-for="(item,index) of imgList">--%>
                        <%--<div class="upload_warp_img_div_top">--%>
                            <%--<div class="upload_warp_img_div_text">--%>
                                <%--{{item.file.name}}--%>
                            <%--</div>--%>
                            <%--<img src="${baseurl}/public/images/update/del.png" class="upload_warp_img_div_del"--%>
                                 <%--@click="fileDel(index)">--%>
                        <%--</div>--%>
                        <%--<img :src="item.file.src">--%>
                    <%--</div>--%>
                <%--</div>--%>
                <%--&lt;%&ndash;<input type="file" name="demo" multiple/>&ndash;%&gt;--%>
                <%--<button type="submit" onclick="submitZip()" class="layui-btn">上传文件</button>--%>
                <%--<button type="reset" class="layui-btn layui-btn-danger">重置</button>--%>
            <%--</form>--%>
        <%--</div>--%>
    <%--</div>--%>
<%--</div>--%>

<script>
    let fileOperation;
    layui.use(['jquery', 'layer', 'element', 'laypage', 'form', 'laytpl', 'tree'], function () {
        window.jQuery = window.$ = layui.jquery;
        window.layer = layui.layer;
        var element = layui.element(),
            form = layui.form(),
            laytpl = layui.laytpl;

        <%--fileOperation = {--%>
        <%--loadFile: function () {--%>
        <%--$.post("${baseurl}/download/zip");--%>
        <%--}--%>
    });

    $(function () {
        $.get("${baseurl}/download/zip");
    })
</script>

<script>
    //  import up from  './src/components/Hello'
    var app = new Vue({
        el: '#app',
        data() {
            return {
                imgList: [],
                size: 0
            }
        },
        methods: {
            fileClick() {
                document.getElementById('upload_file').click()
            },
            fileChange(el) {
                if (!el.target.files[0].size) return;
                this.fileList(el.target);
                el.target.value = ''
            },
            fileList(fileList) {
                let files = fileList.files;
                for (let i = 0; i < files.length; i++) {
                    //判断是否为文件夹
                    if (files[i].type != '') {
                        this.fileAdd(files[i]);
                    } else {
                        //文件夹处理
                        this.folders(fileList.items[i]);
                    }
                }
            },
            //文件夹处理
            folders(files) {
                let _this = this;
                //判断是否为原生file
                if (files.kind) {
                    files = files.webkitGetAsEntry();
                }
                files.createReader().readEntries(function (file) {
                    for (let i = 0; i < file.length; i++) {
                        if (file[i].isFile) {
                            _this.foldersAdd(file[i]);
                        } else {
                            _this.folders(file[i]);
                        }
                    }
                })
            },
            foldersAdd(entry) {
                let _this = this;
                entry.file(function (file) {
                    _this.fileAdd(file)
                })
            },
            fileAdd(file) {
                //总大小
                this.size = this.size + file.size;
                //判断是否为图片文件
                if (file.type.indexOf('image') == -1) {
                    file.src = '${baseurl}/public/images/update/wenjian.png';
                    this.imgList.push({
                        file
                    });
                } else {
                    let reader = new FileReader();
                    reader.vue = this;
                    reader.readAsDataURL(file);
                    reader.onload = function () {
                        file.src = this.result;
                        this.vue.imgList.push({
                            file
                        });
                    }
                }
            },
            fileDel(index) {
                this.size = this.size - this.imgList[index].file.size;//总大小
                this.imgList.splice(index, 1);
            },
            bytesToSize(bytes) {
                if (bytes === 0) return '0 B';
                let k = 1000, // or 1024
                    sizes = ['B', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB'],
                    i = Math.floor(Math.log(bytes) / Math.log(k));
                return (bytes / Math.pow(k, i)).toPrecision(3) + ' ' + sizes[i];
            },
            dragenter(el) {
                el.stopPropagation();
                el.preventDefault();
            },
            dragover(el) {
                el.stopPropagation();
                el.preventDefault();
            },
            drop(el) {
                el.stopPropagation();
                el.preventDefault();
                this.fileList(el.dataTransfer);
            }
        }
    })

</script>

</body>
</html>
