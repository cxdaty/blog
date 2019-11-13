<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:33:"admin_themes\auth_group\auth.html";i:1480268796;s:22:"admin_themes\base.html";i:1520254281;}*/ ?>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>后台管理系统</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" href="/public/static/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="/public/static/css/font-awesome.min.css">
    <!--CSS引用-->
    
<link rel="stylesheet" href="/public/static/css/ztree-metro-style.css">

    <link rel="stylesheet" href="/public/static/css/admin.css">
    <!--[if lt IE 9]>
    <script src="/public/static/js/html5shiv.min.js"></script>
    <script src="/public/static/js/respond.min.js"></script>
    <![endif]-->

<!--JS引用-->
<script src="/public/static/js/jquery.min.js"></script>
<script src="/public/static/layui/layui.js"></script>
<script>
    layui.config({
        base: '/public/static/js/'
    }).use('admin');

    var _current_url = "admin/<?php echo $controller; ?>";
    $('.layui-nav-item').removeClass('layui-this');
    $('.layui-nav-tree a[href*="'+_current_url+'"]').parents('.layui-nav-item').addClass('layui-this layui-nav-itemed');
</script>

<script src="/public/static/js/jquery.ztree.all.min.js"></script>

<!--页面JS脚本-->

<script>
    $(document).ready(function(){
        /**
         * 加载树形授权菜单
         */
        var _id = $("#group_id").val();
        var tree = $("#tree");
        var zTree;

        // zTree 配置项
        var setting = {
            check: {
                enable: true
            },
            view: {
                dblClickExpand: false,
                showLine: true,
                showIcon: false,
                selectedMulti: false
            },
            data: {
                simpleData: {
                    enable: true,
                    idKey: "id",
                    pIdKey: "pid",
                    rootpid: ""
                },
                key: {
                    name: "title"
                }
            }
        };

        $.ajax({
            url: "/index.php/admin/auth_group/getJson",
            type: "post",
            dataType: "json",
            cache: false,
            data: {
                id: _id
            },
            success: function (data) {
                zTree = $.fn.zTree.init(tree, setting, data);
            }
        });

        /**
         * 授权提交
         */
        $("#auth-btn").on("click", function () {
            var checked_ids,auth_rule_ids = [];
            checked_ids = zTree.getCheckedNodes(); // 获取当前选中的checkbox
            $.each(checked_ids, function (index, item) {
                auth_rule_ids.push(item.id);
            });
            $.ajax({
                url: "/index.php/admin/auth_group/updateAuthGroupRule",
                type: "post",
                cache: false,
                data: {
                    id: _id,
                    auth_rule_ids: auth_rule_ids
                },
                success: function (data) {
                    if(data.code === 1){
                        setTimeout(function () {
                            location.href = data.url;
                        }, 1000);
                    }
                    layer.msg(data.msg);
                }
            });
        });
    });
</script>


    
</head>
<body bgcolor="#F7FAFE">
<div class="layui-layout layui-layout-admin">
    <!--头部-->
    <div class="layui-header header">
       <div class="logo"><i class="layui-icon" style="font-size:40px;">&#xe62e;</i>  <?php echo $site_config['site_title']; ?></div>
        <div class="user-action">
            <a href="<?php echo url('/'); ?>" target="_blank">前台首页</a>
            <a href="javascript:;"><i class="layui-icon">&#xe612;</i> <?php echo session('admin_name'); ?></a>
            <a class="" href="<?php echo url('admin/login/logout'); ?>"><i class="layui-icon">&#xe64d;</i> 退出</a>
        </div>
    </div>

    <!--侧边栏-->
    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <ul class="layui-nav layui-nav-tree" id="nav-tree">
                <li class="layui-nav-item layui-nav-title"><a>管理菜单</a></li>
                <li class="layui-nav-item layui-this">
                    <a href="/index.php/admin/index/index"><i class="fa fa-home"></i> 网站概览</a>
                </li>
                <li class="layui-nav-item">
                    <a href="" data-url="/index.php/admin/system/clear" id="clear-cache"><i class="fa fa-trash-o"></i> 清除缓存</a>
                </li>
                <?php if(is_array($menu) || $menu instanceof \think\Collection): if( count($menu)==0 ) : echo "" ;else: foreach($menu as $key=>$vo): if(isset($vo['children'])): ?>
                <li class="layui-nav-item">
                    <a href="javascript:;"><i class="<?php echo $vo['icon']; ?>"></i> <?php echo $vo['title']; ?></a>
                    <?php if(is_array($vo['children']) || $vo['children'] instanceof \think\Collection): if( count($vo['children'])==0 ) : echo "" ;else: foreach($vo['children'] as $key=>$v): ?>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="<?php echo url($v['name']); ?>"> <?php echo $v['title']; ?></a>
                        </dd>
                    </dl>
                    <?php endforeach; endif; else: echo "" ;endif; ?>
                </li>
                <?php else: ?>
                <li class="layui-nav-item">
                    <a href="<?php echo url($vo['name']); ?>"><i class="<?php echo $vo['icon']; ?>"></i> <?php echo $vo['title']; ?></a>
                </li>
                <?php endif; endforeach; endif; else: echo "" ;endif; ?>

                <li class="layui-nav-item" style="height: 30px; text-align: center"></li>
            </ul>
        </div>
    </div>

    <!--主体-->
    
<div class="layui-body">
    <!--tab标签-->
    <div class="layui-tab layui-tab-brief">
        <ul class="layui-tab-title">
            <li class=""><a href="<?php echo url('admin/auth_group/index'); ?>">权限组</a></li>
            <li class=""><a href="<?php echo url('admin/auth_group/add'); ?>">添加权限组</a></li>
            <li class="layui-this">编辑权限组</li>
        </ul>
        <div class="layui-tab-content">
            <div class="layui-tab-item layui-show">
                <ul id="tree" class="ztree"></ul>
            </div>
        </div>
        <input type="hidden" id="group_id" name="id" value="<?php echo $id; ?>">
        <button class="layui-btn" id="auth-btn">授权</button>
    </div>
</div>


    <!--底部-->
    <div class="layui-footer footer">
        <div class="layui-main">
            <p>2016 &copy; <a href="#" target="_blank">唯美博客</a></p>
        </div>
    </div>
</div>

</body>
</html>